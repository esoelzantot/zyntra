import 'package:flutter/material.dart';
import 'package:zyntra/core/data/article_dummy_data.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_abstract.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_introduction.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_mind_map.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_significant_findings.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_summary_and_conclusion.dart';

class ArticleMainContent extends StatelessWidget {
  const ArticleMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticleAbstract(abstractText: ArticleDummyData.abstract),

        SizedBox(height: 48),

        ArticleIntroduction(
          title: 'Introduction',
          body: ArticleDummyData.introduction,
        ),
        SizedBox(height: 48),

        ArticleSignificantFindings(rawContent: ArticleDummyData.significant),
        SizedBox(height: 48),
        InteractiveResearchMap(markmapText: ArticleDummyData.mindMap),

        SizedBox(height: 60),
        ArticleSummaryAndConclusion(
          summaryRaw: ArticleDummyData.summary,
          conclusionRaw: ArticleDummyData.conclusion,
        ),
      ],
    );
  }
}
