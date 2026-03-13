import 'package:flutter/material.dart';
import 'package:zyntra/core/data/article_dummy_data.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_mind_map.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/loading/article_abstract_loading.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/loading/article_introduction_loading.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/loading/article_significant_findings_loading.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/loading/article_summary_and_conclusion_loading.dart';

class ArticleMainContentLoading extends StatelessWidget {
  const ArticleMainContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticleAbstractLoading(),

        SizedBox(height: 48),

        ArticleIntroductionLoading(),
        SizedBox(height: 48),

        ArticleSignificantFindingsLoading(),
        SizedBox(height: 48),
        InteractiveResearchMap(markmapText: ArticleDummyData.mindMap),

        SizedBox(height: 60),
        ArticleSummaryAndConclusionLoading(),
      ],
    );
  }
}
