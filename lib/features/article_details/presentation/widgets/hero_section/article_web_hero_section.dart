import 'package:flutter/material.dart';
import 'package:zyntra/core/functions/launch_url.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/custom_divider.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';
import 'package:zyntra/features/article_details/presentation/widgets/buttons/view_pdf_button.dart';
import 'package:zyntra/features/article_details/presentation/widgets/buttons/visit_link_button.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/topic_chip.dart';

class ArticleWebHeroSection extends StatelessWidget {
  final ArticleDataEntity articleData;

  const ArticleWebHeroSection({super.key, required this.articleData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Title ──────────────────────────────────────────────
        Text(
          articleData.title,
          style: AppStyles.styleBold36(
            context,
          ).copyWith(fontWeight: FontWeight.w900, fontSize: 44),
        ),

        const SizedBox(height: 24),

        // ── Authors + Buttons row ───────────────────────────────
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: authors & date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Authors
                  Text(
                    articleData.authors.join(', '),
                    style: AppStyles.styleMedium20(
                      context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 6),
                  // Date + publisher
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: AppColors.subTextColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Published ${articleData.date}',
                        style: AppStyles.styleMedium16(
                          context,
                        ).copyWith(color: AppColors.subTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 24),

            // Right: action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ViewPdfButton(onPressed: () => launchUrlFunc(articleData.pdf)),
                const SizedBox(width: 12),
                VisitLinkButton(
                  onPressed: () => launchUrlFunc(articleData.link),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        // ── Topics chips ────────────────────────────────────────
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: articleData.topics
              .asMap()
              .entries
              .map((e) => TopicChip(label: e.value, index: e.key))
              .toList(),
        ),

        const SizedBox(height: 20),

        // ── Bottom divider ──────────────────────────────────────
        CustomDivider(),
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
