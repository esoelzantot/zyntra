import 'package:flutter/material.dart';
import 'package:zyntra/core/data/article_dummy_data.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/custom_divider.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/key_findings.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/open_questions.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/relevant_fields.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/research_implications.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/research_limitations.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/research_mechanisms.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/research_methodology.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/research_question.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/statistical_significance.dart';

class ArticleSideContent extends StatelessWidget {
  const ArticleSideContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header: Icon + Title ───────────────────────────
          Row(
            children: [
              // Brain / AI icon in orange
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF97316), // orange
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.psychology_outlined,
                    color: const Color(0xFFF97316),
                    size: 20,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Title
              Text(
                'Research Intelligence',
                style: AppStyles.styleBold22(
                  context,
                ).copyWith(color: Colors.black87),
              ),
            ],
          ),

          const SizedBox(height: 16),

          CustomDivider(),

          const SizedBox(height: 16),

          ResearchQuestion(question: ArticleDummyData.researchQuestion),

          const SizedBox(height: 24),

          StatisticalSignificance(
            body: ArticleDummyData.statisticalSignificance,
          ),

          const SizedBox(height: 24),

          RelevantFields(fields: ArticleDummyData.relevantFields),

          const SizedBox(height: 16),

          CustomDivider(),

          const SizedBox(height: 16),

          OpenQuestions(questions: ArticleDummyData.openQuestions),

          const SizedBox(height: 24),

          KeyFindings(findings: ArticleDummyData.keyFindings),

          const SizedBox(height: 24),

          ResearchImplications(implications: ArticleDummyData.implications),

          const SizedBox(height: 24),

          ResearchLimitations(limitations: ArticleDummyData.limitations),

          const SizedBox(height: 16),

          CustomDivider(),

          const SizedBox(height: 16),

          ResearchMethodology(methodology: ArticleDummyData.methodologies),

          const SizedBox(height: 24),

          ResearchMechanisms(mechanisms: ArticleDummyData.mechanisms),
        ],
      ),
    );
  }
}
