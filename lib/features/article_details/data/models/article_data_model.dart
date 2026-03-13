import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';

class ArticleDataModel extends ArticleDataEntity {
  final String id;
  final String title;
  final String date;
  final List<String> authors;
  final List<String> topics;
  final String abstract;
  final String introduction;
  final String pdf;
  final String link;
  final List<String> significantFindings;
  final List<String> summary;
  final String conclusion;

  ArticleDataModel({
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
  }) : super(
         id: id,
         title: title,
         summary: summary,
         conclusion: conclusion,
         pdf: pdf,
         link: link,
         abstract: abstract,
         introduction: introduction,
         date: date,
         authors: authors,
         topics: topics,
         significantFindings: significantFindings,
       );

  factory ArticleDataModel.fromJson(Map<String, dynamic> json) =>
      ArticleDataModel(
        id: json['pmc_id'] as String? ?? '',
        title: json['title'] as String? ?? '',
        date: json['published_date'] as String? ?? '',
        abstract: json['abstract'] as String? ?? '',
        introduction: json['introduction'] as String? ?? '',
        pdf: json['pdf_url'] as String? ?? '',
        link: json['link'] as String? ?? '',
        conclusion: json['conclusion'] as String? ?? '',
        authors: json['authors'] != null
            ? List<String>.from(json['authors'] as List)
            : [],
        topics: json['topics'] != null
            ? (json['topics'] as String)
                  .split('\n')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList()
            : [],
        significantFindings: json['significant'] != null
            ? (json['significant'] as String)
                  .split('\n')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList()
            : [],
        summary: json['summary'] != null
            ? (json['summary'] as String)
                  .split('\n')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {
    'pmc_id': id,
    'title': title,
    'published_date': date,
    'authors': authors,
    'topics': topics.join('\n'),
    'abstract': abstract,
    'introduction': introduction,
    'pdf_url': pdf,
    'link': link,
    'significant': significantFindings.join('\n'),
    'summary': summary.join('\n'),
    'conclusion': conclusion,
  };
}
