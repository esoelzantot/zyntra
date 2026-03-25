import 'package:flutter/material.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_abstract.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_introduction.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_significant_findings.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_summary_and_conclusion.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/mind_map_bloc_consumer.dart';

class ArticleMainContent extends StatelessWidget {
  final ArticleDataEntity articleData;
  const ArticleMainContent({super.key, required this.articleData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticleAbstract(abstractText: articleData.abstract),

        SizedBox(height: 48),

        ArticleIntroduction(
          title: 'Introduction',
          body: articleData.introduction,
        ),
        SizedBox(height: 48),

        ArticleSignificantFindings(
          significant: articleData.significantFindings,
        ),
        SizedBox(height: 48),
        MindMapBlocConsumer(articleId: articleData.id),

        SizedBox(height: 60),
        ArticleSummaryAndConclusion(
          summaryRaw: articleData.summary,
          conclusionRaw: articleData.conclusion,
        ),
      ],
    );
  }
}
