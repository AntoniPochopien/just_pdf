import 'package:hive_flutter/adapters.dart';

part 'file_metadata.g.dart';

@HiveType(typeId: 0)
class FileMetadata {
  @HiveField(0)
  final String filePath;
  @HiveField(1)
  final DateTime lastViewed;

  const FileMetadata({required this.filePath, required this.lastViewed});
}
