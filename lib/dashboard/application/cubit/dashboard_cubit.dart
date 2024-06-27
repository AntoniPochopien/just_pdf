import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart';
import 'package:just_pdf/di.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.initial());
  final _dashboardRepository = getIt<IDashboardRepository>();
  final _localStorageRepository = getIt<ILocalStorageRepository>();
  static const _uuid = Uuid();

  void init() async {
    final result = await _dashboardRepository.requestStoragePermission();
    if (result) {
      _fetchFiles();
    }
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

    await _localStorageRepository.saveNewFilePath(fileMetadata);
    _fetchFiles();
  }

  void onFileSelected(FileMetadata fileMetadata) async {
    await _localStorageRepository.saveNewFilePath(fileMetadata);
    _fetchFiles();
  }

  void renameFile(
      {required FileMetadata fileMetadata, required String newFileName}) async {
    //TODO move that logic to dashboard repository
    final file = File(fileMetadata.filePath);
    final path = file.path;
    final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final newPath = path.substring(0, lastSeparator + 1) + newFileName;
    await file.rename(newPath);
  }

  void _fetchFiles() {
    final lastSeenFiles =
        List<FileMetadata>.from(_localStorageRepository.getLastSeenFiles());
    emit(DashboardState.data(lastSeenFiles));
  }
}
