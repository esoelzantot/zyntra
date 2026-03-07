import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/articles/presentation/widgets/hero_section/category_chip.dart';

// ─── Data Model ───────────────────────────────────────────────────────────────

class ResearchCategory {
  final String id;
  final String label;

  const ResearchCategory({required this.id, required this.label});
}

// ─── Widget ───────────────────────────────────────────────────────────────────
class ArticlesHeroSection extends StatelessWidget {
  const ArticlesHeroSection({
    super.key,
    required this.selectedCategories,
    required this.onCategoryToggled,
  });

  // ✅ بيستقبل الـ state من الـ parent
  final Set<String> selectedCategories;
  final ValueChanged<String> onCategoryToggled;

  static const List<ResearchCategory> _categories = [
    ResearchCategory(id: 'all', label: 'All Research'),
    ResearchCategory(id: 'astrobiology', label: 'Astrobiology'),
    ResearchCategory(id: 'genetic_engineering', label: 'Genetic Engineering'),
    ResearchCategory(id: 'microgravity', label: 'Microgravity'),
    ResearchCategory(id: 'life_support', label: 'Life Support'),
    ResearchCategory(id: 'bio_informatics', label: 'Bio-Informatics'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 8),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'NASA Intelligence ',
                  style: AppStyles.styleBold36(
                    context,
                  ).copyWith(fontWeight: FontWeight.w900, fontSize: 44),
                ),
                TextSpan(
                  text: 'Research Repository',
                  style: AppStyles.styleBold36(context).copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 44,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 80, top: 12),
          child: Text(
            'Your ultimate gateway to the frontiers of space science. Analyze thousands of complex studies through AI-driven summaries and precision MindMaps in seconds.',
            style: AppStyles.styleMedium20(
              context,
            ).copyWith(color: const Color(0xFF6B7280)),
          ),
        ),

        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 10, // المسافة الأفقية بين الـ chips
            runSpacing: 10, // المسافة العمودية لما يحصل wrap
            children: _categories.map((cat) {
              final isSelected = selectedCategories.contains(cat.id);
              return CategoryChip(
                label: cat.label,
                isSelected: isSelected,
                onTap: () => onCategoryToggled(cat.id),
                selectedColor: const Color(0xFFE8521A),
                borderColor: const Color(0xFFD1D5DB),
                navyText: const Color(0xFF1A2340),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 40),

        Divider(
          height: 0.5,
          thickness: 0.5,
          color: const Color(0xFFD1D5DB).withValues(alpha: 0.75),
        ),
      ],
    );
  }
}
