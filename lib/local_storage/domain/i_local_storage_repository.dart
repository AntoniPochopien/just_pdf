import 'package:just_pdf/dashboard/domain/file_metadata.dart';

abstract class ILocalStorageRepository {
  Future<void> init();
  void saveNewFilePath(FileMetadata fileMetadata);
  List<FileMetadata> getLastSeenFiles();
}
