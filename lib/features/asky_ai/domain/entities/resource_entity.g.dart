// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResourceEntityAdapter extends TypeAdapter<ResourceEntity> {
  @override
  final int typeId = 4;

  @override
  ResourceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResourceEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      section: fields[2] as String,
      score: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ResourceEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.section)
      ..writeByte(3)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
