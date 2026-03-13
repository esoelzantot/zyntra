import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';

class ResourceModel extends ResourceEntity {
  final String pmc_id;
  final String title;
  final String section;
  final num relevance_score;

  ResourceModel({
    required this.pmc_id,
    required this.title,
    required this.section,
    required this.relevance_score,
  }) : super(
         title: title,
         section: section,
         id: pmc_id,
         score: relevance_score,
       );

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
    pmc_id: json['pmc_id'] as String? ?? '',
    title: json['title'] as String? ?? '',
    section: json['section'] as String? ?? '',
    relevance_score: json['relevance_score'] as num? ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    'pmc_id': pmc_id,
    'title': title,
    'section': section,
    'relevance_score': relevance_score,
  };
}
