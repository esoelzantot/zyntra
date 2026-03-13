// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleDataEntityAdapter extends TypeAdapter<ArticleDataEntity> {
  @override
  final int typeId = 1;

  @override
  ArticleDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleDataEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      date: fields[2] as String,
      authors: (fields[3] as List).cast<String>(),
      topics: (fields[4] as List).cast<String>(),
      abstract: fields[5] as String,
      introduction: fields[6] as String,
      pdf: fields[7] as String,
      link: fields[8] as String,
      significantFindings: (fields[9] as List).cast<String>(),
      summary: (fields[10] as List).cast<String>(),
      conclusion: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleDataEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.topics)
      ..writeByte(5)
      ..write(obj.abstract)
      ..writeByte(6)
      ..write(obj.introduction)
      ..writeByte(7)
      ..write(obj.pdf)
      ..writeByte(8)
      ..write(obj.link)
      ..writeByte(9)
      ..write(obj.significantFindings)
      ..writeByte(10)
      ..write(obj.summary)
      ..writeByte(11)
      ..write(obj.conclusion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
