import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_horizontal.dart';
import 'package:zyntra/core/widgets/header/custom_web_header.dart';
import 'package:zyntra/features/library/presentation/widgets/hero_section/library_hero_section.dart';
import 'package:zyntra/features/library/presentation/widgets/library_grid/library_grid.dart';

class LibraryViewWebLayout extends StatefulWidget {
  const LibraryViewWebLayout({super.key});

  @override
  State<LibraryViewWebLayout> createState() => _LibraryViewWebLayoutState();
}

class _LibraryViewWebLayoutState extends State<LibraryViewWebLayout> {
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
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: LibraryHeroSection(
                  // ✅ بنمرر الـ state والـ callback
                  selectedCategories: _selectedCategories,
                  onCategoryToggled: _onCategoryToggled,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: LibraryGrid(
                  // ✅ بنمرر الـ selected categories للـ grid
                  selectedCategories: _selectedCategories,
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
              //   child: CustomFadingWidget(
              //     child: LibraryLoadingGrid(
              //       // ✅ بنمرر الـ selected categories للـ grid
              //       selectedCategories: _selectedCategories,
              //     ),
              //   ),
              // ),
              const CustomFooterHorizontal(),
            ],
          ),
        ),

        Positioned(top: 0, left: 0, right: 0, child: CustomWebHeader()),
      ],
    );
  }
}
