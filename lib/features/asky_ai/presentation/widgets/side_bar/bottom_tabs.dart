import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

import '../../../../../app_theme.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          _TabButton(
            label: 'Threads',
            icon: Icons.forum_outlined,
            isSelected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          const SizedBox(width: 8),
          _TabButton(
            label: 'Resources',
            icon: Icons.layers_outlined,
            isSelected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.orange.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.orange : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? AppColors.orange : AppColors.textMuted,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: AppStyles.styleSemiBold14(context).copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.orange : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
