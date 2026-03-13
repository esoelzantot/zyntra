import 'package:hive/hive.dart';

part 'article_analysis_entity.g.dart';

@HiveType(typeId: 2)
class ArticleAnalysisEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String significance;
  @HiveField(3)
  final List<String> fields;
  @HiveField(4)
  final List<String> openQuestions;
  @HiveField(5)
  final List<String> keyFindings;
  @HiveField(6)
  final List<String> implications;
  @HiveField(7)
  final List<String> limitations;
  @HiveField(8)
  final List<String> methodologies;
  @HiveField(9)
  final List<String> mechanisms;

  const ArticleAnalysisEntity({
    required this.id,
    required this.question,
    required this.significance,
    required this.fields,
    required this.openQuestions,
    required this.keyFindings,
    required this.implications,
    required this.limitations,
    required this.methodologies,
    required this.mechanisms,
  });
}
