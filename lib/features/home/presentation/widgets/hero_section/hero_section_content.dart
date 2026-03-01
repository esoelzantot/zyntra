import 'package:flutter/material.dart';
import 'package:zyntra/core/data/hero_section_data.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/custom_elevated_button.dart';
import 'package:zyntra/core/widgets/custom_outlined_button.dart';

class HeroSectionContent extends StatelessWidget {
  const HeroSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFF6B00), width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6B00),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'LIVE FROM KEPLER-186F STATION',
                  style: AppStyles.styleBold12(context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // TITLE
          Text(
            HerSectionData.title,
            style: AppStyles.styleBold24(
              context,
            ).copyWith(fontSize: 70, fontWeight: FontWeight.w900),
          ),

          // SUBTITLE
          Text(
            HerSectionData.subTitle,
            style: AppStyles.styleBold24(context).copyWith(
              fontSize: 70,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(height: 24),

          // DESCRIPTION
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              HerSectionData.description,
              style: AppStyles.styleMedium24(
                context,
              ).copyWith(color: AppColors.subTextColor),
            ),
          ),

          const SizedBox(height: 36),

          // BUTTONS ROW
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Launch Research Portal button
              CustomElevatedButton(
                onPress: () {},
                title: "Browse Articles",
                backgroundColor: AppColors.primaryColor,
              ),

              const SizedBox(width: 12),

              // View Lab Specs button
              CustomOutlinedButton(onPress: () {}, title: "Ask Asky"),
            ],
          ),
        ],
      ),
    );
  }
}
