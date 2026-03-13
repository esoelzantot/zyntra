// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleEntityAdapter extends TypeAdapter<ArticleEntity> {
  @override
  final int typeId = 0;

  @override
  ArticleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      brief: fields[2] as String,
      date: fields[3] as String,
      saved: fields[4] as bool,
      topics: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticleEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.brief)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.saved)
      ..writeByte(5)
      ..write(obj.topics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
