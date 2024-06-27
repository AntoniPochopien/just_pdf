import 'package:hive_flutter/adapters.dart';

part 'file_metadata.g.dart';

@HiveType(typeId: 0)
class FileMetadata {
  @HiveField(0)
  final String filePath;
  @HiveField(1)
  final DateTime lastViewed;
  @HiveField(2)
  final int sizeInBytes;

  const FileMetadata({required this.filePath, required this.lastViewed, required this.sizeInBytes});

  String get getName => filePath.split('/').last;

  double get getSize => sizeInBytes / (1024 * 1024);
}
