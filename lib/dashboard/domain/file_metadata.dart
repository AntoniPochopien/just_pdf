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
  @HiveField(4)
  final String name;
  @HiveField(5, defaultValue: false)
  final bool favorite;

  const FileMetadata({
    required this.id,
    required this.filePath,
    required this.lastViewed,
    required this.sizeInBytes,
    this.name = '',
    this.favorite = false,
  });

  String get getName => name.isEmpty ? filePath.split('/').last : name;

  double get getSize => sizeInBytes / (1024 * 1024);

  FileMetadata copyWith({
    String? id,
    String? filePath,
    DateTime? lastViewed,
    int? sizeInBytes,
    String? name,
    bool? favorite,
  }) =>
      FileMetadata(
        id: id ?? this.id,
        filePath: filePath ?? this.filePath,
        lastViewed: lastViewed ?? this.lastViewed,
        sizeInBytes: sizeInBytes ?? this.sizeInBytes,
        name: name ?? this.name,
        favorite: favorite ?? this.favorite,
      );
}
