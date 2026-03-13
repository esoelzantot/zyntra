import 'package:hive/hive.dart';

part 'article_data_entity.g.dart';

@HiveType(typeId: 1)
class ArticleDataEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final List<String> authors;
  @HiveField(4)
  final List<String> topics;
  @HiveField(5)
  final String abstract;
  @HiveField(6)
  final String introduction;
  @HiveField(7)
  final String pdf;
  @HiveField(8)
  final String link;
  @HiveField(9)
  final List<String> significantFindings;
  @HiveField(10)
  final List<String> summary;
  @HiveField(11)
  final String conclusion;

  const ArticleDataEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.authors,
    required this.topics,
    required this.abstract,
    required this.introduction,
    required this.pdf,
    required this.link,
    required this.significantFindings,
    required this.summary,
    required this.conclusion,
  });
}
