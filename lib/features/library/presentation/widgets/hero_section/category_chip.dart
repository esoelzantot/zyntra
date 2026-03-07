import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.borderColor,
    required this.navyText,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color borderColor;
  final Color navyText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? selectedColor : borderColor,
            width: 1.5,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: AppStyles.styleSemiBold16(
              context,
            ).copyWith(color: isSelected ? Colors.white : navyText),
          ),
        ),
      ),
    );
  }
}
