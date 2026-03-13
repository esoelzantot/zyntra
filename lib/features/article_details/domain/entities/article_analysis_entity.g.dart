// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_analysis_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleAnalysisEntityAdapter extends TypeAdapter<ArticleAnalysisEntity> {
  @override
  final int typeId = 2;

  @override
  ArticleAnalysisEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleAnalysisEntity(
      id: fields[0] as String,
      question: fields[1] as String,
      significance: fields[2] as String,
      fields: (fields[3] as List).cast<String>(),
      openQuestions: (fields[4] as List).cast<String>(),
      keyFindings: (fields[5] as List).cast<String>(),
      implications: (fields[6] as List).cast<String>(),
      limitations: (fields[7] as List).cast<String>(),
      methodologies: (fields[8] as List).cast<String>(),
      mechanisms: (fields[9] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticleAnalysisEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.significance)
      ..writeByte(3)
      ..write(obj.fields)
      ..writeByte(4)
      ..write(obj.openQuestions)
      ..writeByte(5)
      ..write(obj.keyFindings)
      ..writeByte(6)
      ..write(obj.implications)
      ..writeByte(7)
      ..write(obj.limitations)
      ..writeByte(8)
      ..write(obj.methodologies)
      ..writeByte(9)
      ..write(obj.mechanisms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAnalysisEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
