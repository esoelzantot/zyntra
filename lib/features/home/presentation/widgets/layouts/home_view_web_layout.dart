import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/custom_header.dart';
import 'package:zyntra/core/widgets/footer/custom_footer.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/home_hero_section.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/insight_info.dart';
import 'package:zyntra/features/home/presentation/widgets/newest_articles_list/newest_horizontal_list_view.dart';

class HomeViewWebLayout extends StatelessWidget {
  const HomeViewWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Scrollable Content ────────────────────────────────
        SingleChildScrollView(
          child: Column(
            children: [
              HomeHeroSection(),

              // NewestArticles
              NewestArticles(),

              // InsightInfo
              SizedBox(height: 840, child: InsightInfo()),

              // Footer
              CustomFooter(),
            ],
          ),
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(top: 0, left: 0, right: 0, child: CustomHeader()),
      ],
    );
  }
}
