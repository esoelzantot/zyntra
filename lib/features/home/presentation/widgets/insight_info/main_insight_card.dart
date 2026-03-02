import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/data/insight_info_data.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class MainInsightCard extends StatefulWidget {
  const MainInsightCard({super.key});

  @override
  State<MainInsightCard> createState() => _MainInsightCardState();
}

class _MainInsightCardState extends State<MainInsightCard> {
  late double width = MediaQuery.sizeOf(context).width;
  late bool isDesktop = width > SizeConfig.tablet;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 630,
        child: Stack(
          children: [
            /// ── Background Image ──────────────────────────────
            Positioned.fill(
              child: Image.asset(AppAssets.insightsImage, fit: BoxFit.cover),
            ),

            /// ── Gradient Overlay ──────────────────────────────
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withAlpha(230),
                      Colors.black.withAlpha(80),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),

            /// ── Badge (TOP) ───────────────────────────────────
            Positioned(
              top: 32,
              left: 60,
              child: Container(
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
            ),

            /// ── Content (BOTTOM) ─────────────────────────────
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Title
                    Text(
                      InsightInfoData.mainTitle,
                      style: AppStyles.styleBold32(
                        context,
                      ).copyWith(fontWeight: FontWeight.w900),
                    ),

                    const SizedBox(height: 16),

                    /// Description
                    Text(
                      InsightInfoData.description,
                      style: AppStyles.styleMedium20(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    /// CTA
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Try Asky AI',
                            style: AppStyles.styleBold20(
                              context,
                            ).copyWith(color: Colors.deepOrange),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
