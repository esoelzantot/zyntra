import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/custom_divider.dart';
import 'package:zyntra/features/article_details/presentation/widgets/buttons/view_pdf_button.dart';
import 'package:zyntra/features/article_details/presentation/widgets/buttons/visit_link_button.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/topic_chip.dart';

class ArticleMobileHeroSection extends StatelessWidget {
  final String title;
  final List<String> authors;
  final DateTime publishedDate;
  final String publisherName;
  final List<String> topics;
  final VoidCallback? onViewPdf;
  final VoidCallback? onVisitLink;

  const ArticleMobileHeroSection({
    super.key,
    required this.title,
    required this.authors,
    required this.publishedDate,
    required this.publisherName,
    required this.topics,
    this.onViewPdf,
    this.onVisitLink,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Title ──────────────────────────────────────────────
        Text(
          title,
          style: AppStyles.styleBold36(
            context,
          ).copyWith(fontWeight: FontWeight.w900, fontSize: 44),
        ),

        const SizedBox(height: 24),

        // ── Authors + Buttons row ───────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Right: action buttons
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ViewPdfButton(onPressed: onViewPdf),
                  const SizedBox(width: 12),
                  VisitLinkButton(onPressed: onVisitLink),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Left: authors & date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Authors
                Text(
                  authors.join(', '),
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
                      'Published ${_formatDate(publishedDate)}',
                      style: AppStyles.styleMedium16(
                        context,
                      ).copyWith(color: AppColors.subTextColor),
                    ),
                  ],
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
          children: topics
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
