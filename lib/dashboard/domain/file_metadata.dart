import 'package:hive_flutter/adapters.dart';

part 'file_metadata.g.dart';

@HiveType(typeId: 0)
class FileMetadata {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String filePath;
  @HiveField(2)
  final DateTime lastViewed;
  @HiveField(3)
  final int sizeInBytes;

  const FileMetadata(
      {required this.id,
      required this.filePath,
      required this.lastViewed,
      required this.sizeInBytes});

  String get getName => filePath.split('/').last;

  double get getSize => sizeInBytes / (1024 * 1024);

  static FileMetadata none() => FileMetadata(
      id: '', filePath: '', lastViewed: DateTime.now(), sizeInBytes: 0);

  FileMetadata copyWith(
          {String? id,
          String? filePath,
          DateTime? lastViewed,
          int? sizeInBytes}) =>
      FileMetadata(
        id: id ?? this.id,
        filePath: filePath ?? this.filePath,
        lastViewed: lastViewed ?? this.lastViewed,
        sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      );
}
