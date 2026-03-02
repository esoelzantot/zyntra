import 'package:flutter/material.dart';
import 'package:zyntra/core/data/insight_info_data.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class SideInsightCard extends StatelessWidget {
  final FeatureInfo feature;

  const SideInsightCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF007BFF).withAlpha(25), width: 1.0),
      ),
      child: Row(
        children: [
          /// Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              feature.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.category,
                  style: AppStyles.styleBold14(
                    context,
                  ).copyWith(color: Colors.deepOrange),
                ),
                const SizedBox(height: 8),
                Text(
                  feature.title,
                  style: AppStyles.styleBold22(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  feature.description,
                  style: AppStyles.styleRegular16(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
