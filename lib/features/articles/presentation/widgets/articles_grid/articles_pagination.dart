// lib/core/widgets/article_card/library_pagination.dart

import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';

class ArticlesPagination extends StatelessWidget {
  const ArticlesPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  List<int> get _pages {
    const maxVisible = 3;
    final pages = <int>[];

    if (totalPages <= maxVisible + 2) {
      pages.addAll(List.generate(totalPages, (i) => i + 1));
    } else {
      pages.add(1);
      if (currentPage > 3) pages.add(-1); // ellipsis
      for (
        int p = (currentPage - 1).clamp(2, totalPages - 1);
        p <= (currentPage + 1).clamp(2, totalPages - 1);
        p++
      ) {
        pages.add(p);
      }
      if (currentPage < totalPages - 2) pages.add(-1);
      if (!pages.contains(totalPages)) pages.add(totalPages);
    }

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PaginationButton(
          icon: Icons.chevron_left,
          onTap: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        const SizedBox(width: 6),
        ..._pages.map((p) {
          if (p == -1) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '...',
                style: TextStyle(color: AppColors.subtitleGrey),
              ),
            );
          }
          return _PaginationButton(
            label: '$p',
            isActive: p == currentPage,
            onTap: () => onPageChanged(p),
          );
        }),
        const SizedBox(width: 6),
        _PaginationButton(
          icon: Icons.chevron_right,
          onTap: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
        ),
      ],
    );
  }
}

// ─── Pagination Button ────────────────────────────────────────────────────────
class _PaginationButton extends StatelessWidget {
  const _PaginationButton({
    this.label,
    this.icon,
    this.isActive = false,
    this.onTap,
  });

  final String? label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? AppColors.orange : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? AppColors.orange : AppColors.border,
          ),
        ),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  size: 18,
                  color: disabled ? AppColors.border : AppColors.navy,
                )
              : Text(
                  label!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : AppColors.navy,
                  ),
                ),
        ),
      ),
    );
  }
}
