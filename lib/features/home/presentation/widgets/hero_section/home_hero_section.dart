import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/hero_section_content.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.heroImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Spacer(), HeroSectionContent(), const Spacer()],
      ),
    );
  }
}
