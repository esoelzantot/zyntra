import 'package:flutter/material.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';
import 'package:zyntra/core/utils/app_colors.dart';

class ArticleSignificantFindingsLoading extends StatelessWidget {
  const ArticleSignificantFindingsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Title row ──────────────────────────────────────────
        Row(
          children: [
            Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            CustomFadingWidget.line(width: 220, height: 28, radius: 6),
          ],
        ),

        const SizedBox(height: 24),

        // ── Finding cards skeleton ─────────────────────────────
        ...List.generate(4, (i) => _FindingCardLoading(index: i)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Single finding card skeleton — mirrors FindingCard layout
// ─────────────────────────────────────────────────────────────
class _FindingCardLoading extends StatelessWidget {
  final int index;
  const _FindingCardLoading({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Index badge
          CustomFadingWidget.circle(radius: 16),

          const SizedBox(width: 14),

          // Text lines
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                ...const [null, null, 200.0].map(
                  (w) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CustomFadingWidget.line(
                      width: w,
                      height: 16,
                      radius: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
