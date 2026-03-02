import 'package:flutter/material.dart';
import 'package:zyntra/core/data/insight_info_data.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class MainInsightCard extends StatelessWidget {
  const MainInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(AppAssets.insightsImage, fit: BoxFit.cover),
          ),

          /// Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha(300),
                    Colors.black.withAlpha(200),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          /// Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Badge + Date
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'RESEARCH SPOTLIGHT',
                    style: AppStyles.styleBold14(context),
                  ),
                ),

                const Spacer(),

                /// Title
                Text(
                  InsightInfoData.mainTitle,
                  style: AppStyles.styleBold36(
                    context,
                  ).copyWith(fontWeight: FontWeight.w900),
                ),

                const SizedBox(height: 16),

                /// Description
                Text(
                  InsightInfoData.description,
                  style: AppStyles.styleMedium18(
                    context,
                  ).copyWith(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                /// CTA
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Try Asky AI',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.deepOrange),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
