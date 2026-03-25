import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_vertical.dart';
import 'package:zyntra/core/widgets/header/custom_drawer.dart';
import 'package:zyntra/core/widgets/header/custom_mobile_header.dart';
import 'package:zyntra/features/library/presentation/widgets/hero_section/library_hero_section.dart';
import 'package:zyntra/features/library/presentation/widgets/library_grid/library_grid.dart';

class LibraryViewMobileLayout extends StatefulWidget {
  const LibraryViewMobileLayout({super.key});

  @override
  State<LibraryViewMobileLayout> createState() =>
      _LibraryViewMobileLayoutState();
}

class _LibraryViewMobileLayoutState extends State<LibraryViewMobileLayout> {
  bool _isDrawerOpen = false;

  void _openDrawer() => setState(() => _isDrawerOpen = true);
  void _closeDrawer() => setState(() => _isDrawerOpen = false);

  // ✅ State واحدة مشتركة بين الـ widgets
  final Set<String> _selectedCategories = {'all'};

  void _onCategoryToggled(String id) {
    setState(() {
      if (id == 'all') {
        _selectedCategories
          ..clear()
          ..add('all');
        return;
      }
      _selectedCategories.remove('all');
      if (_selectedCategories.contains(id)) {
        _selectedCategories.remove(id);
        if (_selectedCategories.isEmpty) _selectedCategories.add('all');
      } else {
        _selectedCategories.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: LibraryHeroSection(
                  // ✅ بنمرر الـ state والـ callback
                  selectedCategories: _selectedCategories,
                  onCategoryToggled: _onCategoryToggled,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: LibraryGrid(
                  // ✅ بنمرر الـ selected categories للـ grid
                  selectedCategories: _selectedCategories,
                ),
              ),

              const CustomFooterVertical(),
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
