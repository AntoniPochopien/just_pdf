import 'package:flutter/material.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';

abstract class ILocalStorageRepository {
  Future<void> init();
  Future<void> saveFile(FileMetadata fileMetadata);
  Future<void> deleteFile(String id);
  List<FileMetadata> getFiles();
  Locale? readLocale();
  Future<void> saveLocale(Locale? locale);
}
