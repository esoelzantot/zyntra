import 'package:flutter/material.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_mind_map.dart';

class MindMapNodeWidget extends StatelessWidget {
  final MindMapNode data;
  final bool isSelected;
  final VoidCallback onTap;

  const MindMapNodeWidget({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = depthColor(data.depth);
    final isRoot = data.depth == 0;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: BoxConstraints(
          maxWidth: isRoot ? 160 : 140,
          minWidth: isRoot ? 120 : 80,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isRoot ? 16 : 12,
          vertical: isRoot ? 12 : 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.35)
              : isRoot
              ? color.withValues(alpha: 0.2)
              : const Color(0xFF1E1E30),
          borderRadius: BorderRadius.circular(isRoot ? 50 : 10),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.5),
            width: isSelected ? 2.0 : 1.2,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 12)]
              : isRoot
              ? [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 20)]
              : [],
        ),
        child: Text(
          data.label,
          textAlign: TextAlign.center,
          maxLines: isRoot ? 3 : 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isRoot ? color : Colors.white,
            fontSize: isRoot ? 13 : 11,
            fontWeight: isRoot ? FontWeight.bold : FontWeight.w400,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
