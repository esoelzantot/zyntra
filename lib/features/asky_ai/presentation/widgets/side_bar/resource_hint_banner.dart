import 'package:flutter/material.dart';
import 'package:zyntra/app_theme.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResourcesHintBanner extends StatelessWidget {
  const ResourcesHintBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.orange.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.orange.withValues(alpha: 0.18),
          width: 0.8,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.touch_app_rounded,
              size: 16,
              color: AppColors.orange,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How to load resources',
                  style: AppStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.orange, fontSize: 12),
                ),
                const SizedBox(height: 3),
                Text(
                  'Tap any AI message in the chat to view its research sources here.',
                  style: AppStyles.styleMedium14(context).copyWith(
                    color: AppColors.textMuted,
                    fontSize: 12,
                    height: 1.5,
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
