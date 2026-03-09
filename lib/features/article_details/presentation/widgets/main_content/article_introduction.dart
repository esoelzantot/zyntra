import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ArticleIntroduction extends StatelessWidget {
  final String title;
  final String body;

  const ArticleIntroduction({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
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

        const SizedBox(height: 16),

        // ── Body ───────────────────────────────────────────────
        Text(
          body,
          style: AppStyles.styleRegular20(
            context,
          ).copyWith(color: Color(0xFF94A3B8)),
        ),
      ],
    );
  }
}
