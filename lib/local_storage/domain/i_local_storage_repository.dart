import 'package:just_pdf/dashboard/domain/file_metadata.dart';

abstract class ILocalStorageRepository {
  Future<void> init();
  Future<void> saveFile(FileMetadata fileMetadata);
  Future<void> deleteFile(String id);
  List<FileMetadata> getFiles();
}
