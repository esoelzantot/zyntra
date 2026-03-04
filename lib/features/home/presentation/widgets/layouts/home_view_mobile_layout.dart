import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_vertical.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/home_hero_section.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/insight_info_vertical.dart';
import 'package:zyntra/features/home/presentation/widgets/newest_articles_list/newest_horizontal_list_view.dart';

class HomeViewMobileLayout extends StatelessWidget {
  const HomeViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeHeroSection()),

        // NewestArticles
        SliverToBoxAdapter(child: NewestArticles()),

        // InsightInfo
        SliverToBoxAdapter(child: InsightInfoTablet()),

        // Footer
        SliverToBoxAdapter(child: CustomFooterVertical()),
      ],
    );
  }
}
