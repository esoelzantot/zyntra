import 'package:zyntra/core/data/grouped_articles_topics.dart';

List<String> getTopicsByPmcId(String pmcId) {
  final List<Map<String, dynamic>> data = groupedTopics;

  final List<String> allTopics = [];

  for (final item in data) {
    final pmcIds = List<String>.from(item['pmc_ids'] as List);
    if (pmcIds.contains(pmcId)) {
      allTopics.addAll(List<String>.from(item['topics'] as List));
    }
  }

  return allTopics.toSet().toList();
}
