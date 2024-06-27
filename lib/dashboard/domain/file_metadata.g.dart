// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_metadata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileMetadataAdapter extends TypeAdapter<FileMetadata> {
  @override
  final int typeId = 0;

  @override
  FileMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileMetadata(
      filePath: fields[0] as String,
      lastViewed: fields[1] as DateTime,
      sizeInBytes: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FileMetadata obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.filePath)
      ..writeByte(1)
      ..write(obj.lastViewed)
      ..writeByte(2)
      ..write(obj.sizeInBytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
