import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/article_details/presentation/widgets/significant_findings/finding_card.dart';

// ─────────────────────────────────────────────────────────────
// ArticleSignificantFindings
// ─────────────────────────────────────────────────────────────
class ArticleSignificantFindings extends StatelessWidget {
  /// The raw "significant" string from the API response.
  final List<String> significant;

  /// Optional override title (defaults to "Significant Findings").
  final String title;

  const ArticleSignificantFindings({
    super.key,
    required this.significant,
    this.title = 'Significant Findings',
  });

  @override
  Widget build(BuildContext context) {
    final findings = significant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Title ──────────────────────────────────────────────
        Row(
          children: [
            Container(
              width: 32,
              height: 4,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              title,
              style: AppStyles.styleBold28(
                context,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // ── Finding cards ───────────────────────────────────────
        ...findings.asMap().entries.map(
          (e) =>
              FindingCard(text: e.value, index: e.key, total: findings.length),
        ),
      ],
    );
  }
}
