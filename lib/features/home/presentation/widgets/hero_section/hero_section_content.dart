import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/data/hero_section_data.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/hero_call_actions.dart';

class HeroSectionContent extends StatefulWidget {
  const HeroSectionContent({super.key});

  @override
  State<HeroSectionContent> createState() => _HeroSectionContentState();
}

class _HeroSectionContentState extends State<HeroSectionContent> {
  late double width;
  late double padding;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    padding = (width < SizeConfig.tablet) ? 12.0 : 36.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
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
            child: FittedBox(
              fit: BoxFit.scaleDown,
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
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      HeroSectionData.badge,
                      style: AppStyles.styleBold12(context),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // TITLE
          Text(
            HeroSectionData.title,
            style: AppStyles.styleBold24(
              context,
            ).copyWith(fontSize: 60, fontWeight: FontWeight.w900),
          ),

          // SUBTITLE
          Text(
            HeroSectionData.subTitle,
            style: AppStyles.styleBold24(context).copyWith(
              fontSize: 60,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(height: 24),

          // DESCRIPTION
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              HeroSectionData.description,
              style: AppStyles.styleMedium24(
                context,
              ).copyWith(color: AppColors.subTextColor),
            ),
          ),

          const SizedBox(height: 24),

          // BUTTONS ROW
          HeroCallActions(),
        ],
      ),
    );
  }
}
