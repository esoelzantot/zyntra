import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_vertical.dart';
import 'package:zyntra/core/widgets/header/custom_mobile_header.dart';
import 'package:zyntra/features/articles/presentation/widgets/articles_grid/articles_grid.dart';
import 'package:zyntra/features/articles/presentation/widgets/hero_section/articles_hero_section.dart';

class LibraryViewMobileLayout extends StatefulWidget {
  const LibraryViewMobileLayout({super.key});

  @override
  State<LibraryViewMobileLayout> createState() =>
      _LibraryViewMobileLayoutState();
}

class _LibraryViewMobileLayoutState extends State<LibraryViewMobileLayout> {
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
                child: ArticlesHeroSection(
                  // ✅ بنمرر الـ state والـ callback
                  selectedCategories: _selectedCategories,
                  onCategoryToggled: _onCategoryToggled,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ArticlesGrid(
                  // ✅ بنمرر الـ selected categories للـ grid
                  selectedCategories: _selectedCategories,
                ),
              ),

              const CustomFooterVertical(),
            ],
          ),
        ),

        Positioned(top: 0, left: 0, right: 0, child: CustomMobileHeader()),
      ],
    );
  }
}
