import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/functions/get_article_topics.dart';

class ArticleModel extends ArticleEntity {
  final String pmc_id;
  final String title;
  final String abstract;
  final String published_date;

  ArticleModel({
    required this.pmc_id,
    required this.title,
    required this.abstract,
    required this.published_date,
  }) : super(
         id: pmc_id,
         brief: abstract,
         title: title,
         saved: false,
         date: published_date,
         topics: getTopicsByPmcId(pmc_id),
       );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    pmc_id: json['pmc_id'] as String? ?? '',
    title: json['title'] as String? ?? '',
    abstract: json['abstract'] as String? ?? '',
    published_date: json['published_date'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'pmc_id': pmc_id,
    'title': title,
    'abstract': abstract,
    'published_date': published_date,
  };
}
