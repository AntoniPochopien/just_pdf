// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionsAdapter extends TypeAdapter<Options> {
  @override
  final int typeId = 1;

  @override
  Options read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Options.lastSeen;
      case 1:
        return Options.alphabeticalOrder;
      case 2:
        return Options.favorite;
      default:
        return Options.lastSeen;
    }
  }

  @override
  void write(BinaryWriter writer, Options obj) {
    switch (obj) {
      case Options.lastSeen:
        writer.writeByte(0);
        break;
      case Options.alphabeticalOrder:
        writer.writeByte(1);
        break;
      case Options.favorite:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
