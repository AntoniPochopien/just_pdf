import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/dashboard/domain/options.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:uuid/uuid.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final IDashboardRepository dashboardRepository;
  final ILocalStorageRepository localStorageRepository;
  final IPrintingRepository printingRepository;
  DashboardCubit({
    required this.dashboardRepository,
    required this.localStorageRepository,
    required this.printingRepository,
  }) : super(const DashboardState.loading());
  static const _uuid = Uuid();

  void init() async {
    final permissionGranted =
        await dashboardRepository.requestStoragePermission();
    final lastOption = localStorageRepository.getLastOption();
    if (permissionGranted) {
      await _getPdfFromIntent();
      if (lastOption == null) {
        fetchLastSeenFiles();
      } else {
        switch (lastOption) {
          case Options.alphabeticalOrder:
            fetchAlphabeticalOrderFiles();
          case Options.lastSeen:
            fetchLastSeenFiles();
          case Options.favorite:
            fetchFavoriteFiles();
        }
      }
    } else {
      emit(const DashboardState.notPermitted());
    }
  }

  void checkPermissions() async {
    final permission = await dashboardRepository.checkStoragePermission();
    if (permission) {
      init();
    }
  }

  Future<void> _getPdfFromIntent() async {
    final result = await dashboardRepository.getPdfFromIntent();
    result.fold((l) {}, (r) async {
      if (r == null) {
        return;
      }
      fetchLastSeenFiles();
      final newFile = r.copyWith(id: _uuid.v1());
      await localStorageRepository.saveFile(newFile);
      emit(DashboardState.openPdf(file: newFile, previousState: state));
    });
  }

  void pickPdfFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result == null) return;

    final file = result.files.single;

    final fileMetadata = FileMetadata(
      id: _uuid.v1(),
      filePath: file.path!,
      sizeInBytes: file.size,
      lastViewed: DateTime.now(),
    );

    await localStorageRepository.saveFile(fileMetadata);
    emit(DashboardState.openPdf(file: fileMetadata, previousState: state));
  }

  void deleteFiles(List<FileMetadata> fileMetadataList) async {
    await Future.wait(fileMetadataList
        .map((file) => localStorageRepository.deleteFile(file.id)));

    state.whenOrNull(
        lastSeenFiles: (_) => fetchLastSeenFiles(),
        alphabeticalOrderFiles: (_) => fetchAlphabeticalOrderFiles(),
        filesSelection: (selectedFiles, allFiles) {
          final updatedFiles = allFiles
              .where((file) => !fileMetadataList.contains(file))
              .toList();
          emit(DashboardState.filesSelection(
              selectedFiles: [], allFiles: updatedFiles));
        });
  }

  void openFile(FileMetadata fileMetadata) async {
    await localStorageRepository.saveFile(fileMetadata);
    emit(DashboardState.openPdf(file: fileMetadata, previousState: state));
  }

  void fetchLastSeenFiles() {
    localStorageRepository.saveLastOption(Options.lastSeen);

    final allFiles = List<FileMetadata>.from(localStorageRepository.getFiles());

    //sort: newest on the top
    allFiles.sort((a, b) => b.lastViewed.compareTo(a.lastViewed));

    emit(DashboardState.lastSeenFiles(lastSeenFiles: allFiles));
  }

  void fetchAlphabeticalOrderFiles() {
    localStorageRepository.saveLastOption(Options.alphabeticalOrder);

    final allFiles = List<FileMetadata>.from(localStorageRepository.getFiles());

    //sort: alphabetical order a-z

    allFiles.sort((a, b) => a.getName.compareTo(b.getName));

    emit(DashboardState.alphabeticalOrderFiles(alphabeticalFiles: allFiles));
  }

  void fetchFavoriteFiles() {
    localStorageRepository.saveLastOption(Options.favorite);
    final allFiles = List<FileMetadata>.from(localStorageRepository.getFiles());

    //take only favorite files

    final favoriteFiles =
        allFiles.where((element) => element.favorite).toList();

    emit(DashboardState.favoriteFiles(favoriteFiles: favoriteFiles));
  }

  void reloadFiles() {
    if (state is _OpenPdf) {
      final s = state as _OpenPdf;
      s.previousState?.mapOrNull(
        lastSeenFiles: (_) => fetchLastSeenFiles(),
        alphabeticalOrderFiles: (_) => fetchAlphabeticalOrderFiles(),
        favoriteFiles: (_) => fetchFavoriteFiles(),
      );
    }
  }

  void printFile(FileMetadata fileMetadata) async =>
      await printingRepository.print(fileMetadata);

  void share(List<FileMetadata> fileMetadataList) async =>
      await printingRepository.share(fileMetadataList);

  void startFilesSelection(
          {required FileMetadata selectedFile,
          required List<FileMetadata> allFiles}) =>
      emit(DashboardState.filesSelection(
          selectedFiles: [selectedFile], allFiles: allFiles));

  void selectFile(FileMetadata selectedFile) {
    if (state is _FilesSelection) {
      final s = state as _FilesSelection;
      final selectedFiles = List<FileMetadata>.from(s.selectedFiles);
      if (selectedFiles.contains(selectedFile)) {
        selectedFiles.remove(selectedFile);
      } else {
        selectedFiles.add(selectedFile);
      }
      emit(s.copyWith(selectedFiles: selectedFiles));
    }
  }

  void toggleFavorite(FileMetadata file) async {
    final updatedFile = file.copyWith(favorite: !file.favorite);
    await localStorageRepository.saveFavorite(updatedFile);
    state.mapOrNull(
      lastSeenFiles: (_) => fetchLastSeenFiles(),
      alphabeticalOrderFiles: (_) => fetchAlphabeticalOrderFiles(),
      favoriteFiles: (_) => fetchFavoriteFiles(),
    );
  }
}
