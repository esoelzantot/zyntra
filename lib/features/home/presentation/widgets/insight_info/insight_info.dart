import 'package:flutter/material.dart';
import 'package:zyntra/core/data/insight_info_data.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/main_insight_card.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/side_insight_card.dart';

class InsightInfo extends StatelessWidget {
  const InsightInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT MAIN CARD
          Flexible(flex: 2, child: MainInsightCard()),

          const SizedBox(width: 24),

          /// RIGHT SIDE LIST
          Flexible(
            flex: 1,
            child: ListView.builder(
              itemCount: InsightInfoData.features.length,
              itemBuilder: (context, index) {
                final feature = InsightInfoData.features[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SideInsightCard(feature: feature),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
