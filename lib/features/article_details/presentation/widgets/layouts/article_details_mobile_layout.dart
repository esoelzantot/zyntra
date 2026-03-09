import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_vertical.dart';
import 'package:zyntra/core/widgets/header/custom_drawer.dart';
import 'package:zyntra/core/widgets/header/custom_mobile_header.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/article_mobile_hero_section.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_main_content.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/article_side_content.dart';

class ArticleDetailsMobileLayout extends StatefulWidget {
  const ArticleDetailsMobileLayout({super.key});

  @override
  State<ArticleDetailsMobileLayout> createState() =>
      _ArticleDetailsMobileLayoutState();
}

class _ArticleDetailsMobileLayoutState extends State<ArticleDetailsMobileLayout>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  bool _isDrawerOpen = false;

  void _openDrawer() => setState(() => _isDrawerOpen = true);
  void _closeDrawer() => setState(() => _isDrawerOpen = false);

  final List<_TabMeta> _tabs = const [
    _TabMeta(label: 'Article', icon: Icons.article_outlined),
    _TabMeta(label: 'Analysis', icon: Icons.biotech_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 100),

                  // ── Hero ────────────────────────────────────
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DesignConstants.defaultMobile_HP,
                    ),
                    child: ArticleMobileHeroSection(
                      title: 'MHC Diversity Across Time and Space',
                      authors: const [
                        'Cortazar‑Chinarro Maria',
                        'King Kayla C.',
                        'Lillie Mette',
                      ],
                      publishedDate: DateTime(2025, 4, 28),
                      publisherName: 'Nature Genetics Review',
                      topics: const [
                        'Conservation Biology',
                        'Evolutionary Biology',
                        'Population Genetics',
                        'Immunogenetics',
                      ],
                      onViewPdf: () => debugPrint('View PDF tapped'),
                      onVisitLink: () => debugPrint('Visit Live Link tapped'),
                    ),
                  ),
                ],
              ),
            ),

            // ── Sticky Tab Bar ─────────────────────────────
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                tabController: _tabController,
                tabs: _tabs,
                horizontalPadding: DesignConstants.defaultMobile_HP,
              ),
            ),
          ],

          body: TabBarView(
            controller: _tabController,
            children: [
              // ── Tab 1: Article ───────────────────────────
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: DesignConstants.defaultMobile_HP,
                        vertical: DesignConstants.defaultMobile_VP,
                      ),
                      child: const ArticleMainContent(),
                    ),
                    const CustomFooterVertical(),
                  ],
                ),
              ),

              // ── Tab 2: Analysis ──────────────────────────
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: DesignConstants.defaultMobile_HP,
                        vertical: DesignConstants.defaultMobile_VP,
                      ),
                      child: const ArticleSideContent(),
                    ),
                    const CustomFooterVertical(),
                  ],
                ),
              ),
            ],
          ),
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

// ── Sticky Tab Bar Delegate ────────────────────────────────
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final List<_TabMeta> tabs;
  final double horizontalPadding;

  const _StickyTabBarDelegate({
    required this.tabController,
    required this.tabs,
    required this.horizontalPadding,
  });

  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) => false;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_ArticleTabBar(controller: tabController, tabs: tabs)],
      ),
    );
  }
}

// ── Custom Tab Bar ─────────────────────────────────────────
class _ArticleTabBar extends StatelessWidget {
  final TabController controller;
  final List<_TabMeta> tabs;

  const _ArticleTabBar({required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(tabs.length, (index) {
        final isSelected = controller.index == index;
        return GestureDetector(
          onTap: () => controller.animateTo(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF97316) : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFF97316)
                    : const Color(0xFFE2E8F0),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  tabs[index].icon,
                  size: 15,
                  color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                ),
                const SizedBox(width: 7),
                Text(
                  tabs[index].label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ── Meta ───────────────────────────────────────────────────
class _TabMeta {
  final String label;
  final IconData icon;

  const _TabMeta({required this.label, required this.icon});
}
