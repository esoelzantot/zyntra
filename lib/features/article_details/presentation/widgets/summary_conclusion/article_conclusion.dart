import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ArticleConclusion extends StatelessWidget {
  final String text;
  const ArticleConclusion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2235),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Conclusion',
            style: AppStyles.styleBold24(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 16),
          Text(
            text.trim(),
            style: AppStyles.styleRegular18(
              context,
            ).copyWith(color: Color(0xffCBD5E1)),
          ),
        ],
      ),
    );
  }
}
