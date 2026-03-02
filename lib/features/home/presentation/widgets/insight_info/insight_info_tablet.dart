import 'package:flutter/material.dart';
import 'package:zyntra/core/data/insight_info_data.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/main_insight_card.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/side_insight_card.dart';

class InsightInfoTablet extends StatelessWidget {
  const InsightInfoTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
      child: Column(
        children: [
          /// MAIN CARD
          const MainInsightCard(),

          const SizedBox(height: 24),

          /// SIDE LIST
          ...InsightInfoData.features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SideInsightCard(feature: feature),
            ),
          ),
        ],
      ),
    );
  }
}
