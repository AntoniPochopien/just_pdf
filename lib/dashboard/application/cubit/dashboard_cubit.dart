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
  static const  _uuid =  Uuid();


  void init() async {
    await _dashboardRepository.requestStoragePermission();
    _fetchFiles();
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

  void onFileSelected(FileMetadata fileMetadata)async{
    await _localStorageRepository.saveNewFilePath(fileMetadata);
    _fetchFiles();
  }

  void _fetchFiles() {
    final lastSeenFiles = List<FileMetadata>.from(_localStorageRepository.getLastSeenFiles());
    emit(DashboardState.data(lastSeenFiles));
  }
}
