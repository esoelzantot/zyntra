import 'package:flutter/material.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_mind_map.dart';

class InfoBar extends StatelessWidget {
  final MindMapNode node;
  const InfoBar({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final color = depthColor(node.depth);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 160),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row
          Row(
            children: [
              Icon(Icons.circle, size: 10, color: color),
              const SizedBox(width: 8),
              Text(
                'Depth ${node.depth}',
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Scrollable full text
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                node.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
