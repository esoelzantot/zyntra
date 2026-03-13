import 'package:hive/hive.dart';

part 'article_entity.g.dart';

@HiveType(typeId: 0)
class ArticleEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String brief;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final bool saved;
  @HiveField(5)
  final List<String> topics;

  const ArticleEntity({
    required this.id,
    required this.title,
    required this.brief,
    required this.date,
    required this.saved,
    required this.topics,
  });

  ArticleEntity copyWith({
    String? id,
    String? title,
    String? brief,
    String? date,
    bool? saved,
    List<String>? topics,
  }) {
    return ArticleEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      brief: brief ?? this.brief,
      date: date ?? this.date,
      saved: saved ?? this.saved,
      topics: topics ?? this.topics,
    );
  }
}
