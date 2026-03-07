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
  late double width;
  late double spacer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    spacer = (width < SizeConfig.tablet) ? 40.0 : 240.0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.insightsImage),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(
                alpha: 0.5,
              ), // غير الـ Alpha للتحكم في الشدة
              BlendMode.darken,
            ),
          ),
          gradient: LinearGradient(
            colors: [Colors.black.withAlpha(230), Colors.black.withAlpha(80)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ── Badge (TOP) ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40),
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

            // ── Dynamic Spacer ─────────────────────────────
            SizedBox(height: spacer),

            /// ── Content (BOTTOM) ─────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
          ],
        ),
      ),
    );
  }
}
