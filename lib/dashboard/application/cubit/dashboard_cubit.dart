import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final IDashboardRepository dashboardRepository;
  final ILocalStorageRepository localStorageRepository;
  DashboardCubit({
    required this.dashboardRepository,
    required this.localStorageRepository
  }) : super(const DashboardState.loading());
  static const _uuid = Uuid();

  void init() async {
    final permissionGranted =
        await dashboardRepository.requestStoragePermission();
    if (permissionGranted) {
      await _getPdfFromIntent();
      fetchLastSeenFiles();
    }
  }

  Future<void> _getPdfFromIntent() async {
    final result = await dashboardRepository.getPdfFromIntent();
    result.fold((l) {}, (r) async {
      final newFile = r.copyWith(id: _uuid.v1());
      await localStorageRepository.saveFile(newFile);
      emit(DashboardState.openPdf(newFile));
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
    emit(DashboardState.openPdf(fileMetadata));
  }

  void deleteFile(FileMetadata fileMetadata) async {
    await localStorageRepository.deleteFile(fileMetadata.id);
    state.whenOrNull(
      lastSeenFiles: (_) => fetchLastSeenFiles(),
      alphabeticalOrderFiles: (_) => alphabeticalOrderFiles(),
    );
  }

  void onFileTap(FileMetadata fileMetadata) async {
    await localStorageRepository.saveFile(fileMetadata);
    emit(DashboardState.openPdf(fileMetadata));
  }

  void fetchLastSeenFiles() {
    final allFiles =
        List<FileMetadata>.from(localStorageRepository.getFiles());

    //sort: newest on the top
    allFiles.sort((a, b) => b.lastViewed.compareTo(a.lastViewed));
    
    emit(DashboardState.lastSeenFiles(lastSeenFiles: allFiles));
  }

    void alphabeticalOrderFiles() {
    final allFiles =
        List<FileMetadata>.from(localStorageRepository.getFiles());
    
    //sort: alphabetical order a-z

    allFiles.sort((a, b) => a.getName.compareTo(b.getName));
      
    emit(DashboardState.alphabeticalOrderFiles(alphabeticalFiles: allFiles));
  }
}
