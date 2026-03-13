import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';

class ArticleCardCopy extends StatelessWidget {
  const ArticleCardCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 370 / 450,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.articleCardBG.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(),
      ),
    );
  }
}
