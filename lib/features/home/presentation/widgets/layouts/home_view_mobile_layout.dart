import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_vertical.dart';
import 'package:zyntra/core/widgets/header/custom_drawer.dart';
import 'package:zyntra/core/widgets/header/custom_mobile_header.dart';
import 'package:zyntra/features/home/presentation/widgets/hero_section/home_hero_section.dart';
import 'package:zyntra/features/home/presentation/widgets/insight_info/insight_info_vertical.dart';
import 'package:zyntra/features/home/presentation/widgets/newest_articles_list/newest_horizontal_list_view.dart';

class HomeViewMobileLayout extends StatefulWidget {
  const HomeViewMobileLayout({super.key});

  @override
  State<HomeViewMobileLayout> createState() => _HomeViewMobileLayoutState();
}

class _HomeViewMobileLayoutState extends State<HomeViewMobileLayout> {
  bool _isDrawerOpen = false;

  void _openDrawer() => setState(() => _isDrawerOpen = true);
  void _closeDrawer() => setState(() => _isDrawerOpen = false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Main Content ──────────────────────────────────────
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeHeroSection()),
            SliverToBoxAdapter(child: NewestArticles()),
            SliverToBoxAdapter(child: InsightInfoTablet()),
            SliverToBoxAdapter(child: CustomFooterVertical()),
          ],
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomMobileHeader(
            onMenuTap: _openDrawer, // ✅ بنمرر الـ callback
          ),
        ),

        // ── Scrim (backdrop) ─────────────────────────────────
        if (_isDrawerOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDrawer,
              child: AnimatedOpacity(
                opacity: _isDrawerOpen ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(color: Colors.black.withAlpha(140)),
              ),
            ),
          ),

        // ── Drawer Panel ──────────────────────────────────────
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: 0,
          bottom: 0,
          left: _isDrawerOpen ? 0 : -300,
          width: 290,
          child: CustomDrawer(
            onClose: _closeDrawer,
          ), // ✅ بنمرر الـ close callback
        ),
      ],
    );
  }
}
