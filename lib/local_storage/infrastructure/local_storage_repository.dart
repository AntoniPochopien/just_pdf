import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';
import 'package:hive_flutter/adapters.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  late final Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FileMetadataAdapter());
    box = await Hive.openBox('JustPDF');
  }

  @override
  Future<void> saveNewFilePath(FileMetadata fileMetadata) async {
    final lastSeenFiles = getLastSeenFiles();
    final existingFileIndex = lastSeenFiles.indexWhere((file) =>
        file.id == fileMetadata.id || (file.getName == fileMetadata.getName && file.sizeInBytes == fileMetadata.sizeInBytes));

    if (existingFileIndex != -1) {
      final existingFile =
          lastSeenFiles[existingFileIndex].copyWith(lastViewed: DateTime.now());
      lastSeenFiles[existingFileIndex] = existingFile;
    } else {
      final newFileMetadata = fileMetadata.copyWith(lastViewed: DateTime.now());
      lastSeenFiles.add(newFileMetadata);
    }

    lastSeenFiles.sort((a, b) => b.lastViewed.compareTo(a.lastViewed));

    final limitedList = lastSeenFiles.take(20).toList();

    await box.put('files', limitedList);
  }

  @override
  List<FileMetadata> getLastSeenFiles() {
    final List<dynamic>? files = box.get('files');
    return files == null ? [] : files.cast<FileMetadata>();
  }
}
