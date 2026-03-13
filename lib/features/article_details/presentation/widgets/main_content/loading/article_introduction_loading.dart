import 'package:flutter/material.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';
import 'package:zyntra/core/utils/app_colors.dart';

class ArticleIntroductionLoading extends StatelessWidget {
  const ArticleIntroductionLoading({super.key});

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
            CustomFadingWidget.line(width: 200, height: 30, radius: 6),
          ],
        ),

        const SizedBox(height: 20),

        // ── Body lines ─────────────────────────────────────────
        ...const [null, null, null, null, null, null, 240.0].map(
          (w) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomFadingWidget.line(width: w, height: 18, radius: 4),
          ),
        ),
      ],
    );
  }
}
