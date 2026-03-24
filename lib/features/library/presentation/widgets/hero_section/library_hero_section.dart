import 'package:flutter/material.dart';
import 'package:zyntra/core/data/articles_categories.dart';
import 'package:zyntra/core/data/entities/category_entity.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/articles/presentation/widgets/hero_section/category_chip.dart';

// ─── Widget ───────────────────────────────────────────────────────────────────
class LibraryHeroSection extends StatelessWidget {
  const LibraryHeroSection({
    super.key,
    required this.selectedCategories,
    required this.onCategoryToggled,
  });

  final Set<String> selectedCategories;
  final ValueChanged<String> onCategoryToggled;

  static const List<CategoryEntity> _categories = articlesCategories;

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
                  text: 'Saved ',
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
          padding: const EdgeInsets.only(left: 20, right: 80, top: 10),
          child: Text(
            'Access your bookmarked articles and their corresponding AI intelligence reports in one organized space.',
            style: AppStyles.styleMedium20(
              context,
            ).copyWith(color: const Color(0xFF6B7280)),
          ),
        ),

        const SizedBox(height: 40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
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
