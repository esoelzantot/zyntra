import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ArticlesEmpty extends StatelessWidget {
  const ArticlesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.article_outlined,
              size: 30,
              color: AppColors.subtitleGrey,
            ),
          ),
          const SizedBox(height: 16),
          Text('NO ARTICLES FOUND', style: AppStyles.styleBold24(context)),
          const SizedBox(height: 8),
          Text(
            'Try selecting different categories\nor check back later.',
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium20(
              context,
            ).copyWith(color: AppColors.subtitleGrey),
          ),
        ],
      ),
    );
  }
}
