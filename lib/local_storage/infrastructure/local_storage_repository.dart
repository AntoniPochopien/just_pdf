import 'dart:ui';

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
  Future<void> saveFile(FileMetadata fileMetadata) async {
    final allFiles = getFiles();
    final existingFileIndex = allFiles.indexWhere((file) =>
        file.id == fileMetadata.id ||
        (file.getName == fileMetadata.getName &&
            file.sizeInBytes == fileMetadata.sizeInBytes));

    if (existingFileIndex != -1) {
      final existingFile =
          allFiles[existingFileIndex].copyWith(lastViewed: DateTime.now());
      allFiles[existingFileIndex] = existingFile;
    } else {
      final newFileMetadata = fileMetadata.copyWith(lastViewed: DateTime.now());
      allFiles.add(newFileMetadata);
    }

    final limitedList = allFiles.take(100).toList();

    await box.put('files', limitedList);
  }

  @override
  List<FileMetadata> getFiles() {
    final List<dynamic>? files = box.get('files');
    return files == null ? [] : files.cast<FileMetadata>();
  }

  @override
  Future<void> deleteFile(String id) async {
    final files = getFiles();
    files.removeWhere((element) => element.id == id);
    await box.put('files', files);
  }

  @override
  Locale? readLocale() {
    final langCode = box.get('locale');
    if (langCode != null) {
      return Locale(langCode);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveLocale(Locale? locale) =>
      box.put('locale', locale?.languageCode);
}
