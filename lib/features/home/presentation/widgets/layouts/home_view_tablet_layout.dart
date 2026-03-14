import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_horizontal.dart';
import 'package:zyntra/core/widgets/header/custom_web_header.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/home_hero_section.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/insight_info_vertical.dart';
import 'package:zyntra/features/home/presentation/widgets/newest_articles_list/newest_articles_list_view_bloc_consumer.dart';

class HomeViewTabletLayout extends StatelessWidget {
  const HomeViewTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Scrollable Content ────────────────────────────────
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeHeroSection()),

            // NewestArticles
            SliverToBoxAdapter(child: NewestArticlesListViewBlocConsumer()),

            // InsightInfo
            SliverToBoxAdapter(child: InsightInfoTablet()),

            // Footer
            SliverToBoxAdapter(child: CustomFooterHorizontal()),
          ],
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(top: 0, left: 0, right: 0, child: CustomWebHeader()),
      ],
    );
  }
}
