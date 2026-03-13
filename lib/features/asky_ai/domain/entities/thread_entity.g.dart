// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThreadEntityAdapter extends TypeAdapter<ThreadEntity> {
  @override
  final int typeId = 5;

  @override
  ThreadEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThreadEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      date: fields[2] as String,
      messages: (fields[3] as List).cast<MessageEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ThreadEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThreadEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
