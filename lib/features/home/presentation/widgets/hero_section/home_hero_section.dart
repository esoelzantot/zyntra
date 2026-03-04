import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/hero_section_content.dart';

class HomeHeroSection extends StatefulWidget {
  const HomeHeroSection({super.key});

  @override
  State<HomeHeroSection> createState() => _HomeHeroSectionState();
}

class _HomeHeroSectionState extends State<HomeHeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 90),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.heroImage),
          fit: BoxFit.fill,
        ),
      ),
      child: HeroSectionContent(),
    );
  }
}
