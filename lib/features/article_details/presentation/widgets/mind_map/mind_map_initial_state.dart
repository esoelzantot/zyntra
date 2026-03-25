import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/mind_map_header.dart';

class MindMapInitialState extends StatelessWidget {
  final VoidCallback onGenerate;

  const MindMapInitialState({super.key, required this.onGenerate});

  // Canvas is kept at the original size so node math stays identical,
  // but we clip it to 350 h and center it inside a fixed-height box.
  static const double _canvasSize = _RadialLayoutEngine.canvasSize;
  static const double _visibleHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MindMapHeader(zoomIn: () {}, zoomOut: () {}, fullScreen: () {}),

        SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: _visibleHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: OverflowBox(
              maxWidth: _canvasSize,
              maxHeight: _canvasSize,
              alignment: Alignment.center,
              child: Container(
                color: const Color(0xFF111827),
                width: _canvasSize,
                height: _canvasSize,
                child: Stack(
                  children: [
                    // Skeleton connection lines
                    Positioned.fill(
                      child: CustomPaint(painter: _SkeletonPainter()),
                    ),

                    // Skeleton L1 nodes
                    ..._buildSkeletonNodes(context),

                    // Centered Generate button
                    Center(child: _GenerateMindMapButton(onTap: onGenerate)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSkeletonNodes(BuildContext context) {
    const double cx = _canvasSize / 2;
    const double cy = _canvasSize / 2;
    const double level1Radius = 240.0;
    const int count = 6;

    final List<Widget> nodes = [];

    for (int i = 0; i < count; i++) {
      final angle = (2 * math.pi * i) / count - math.pi / 2;
      final pos = Offset(
        cx + level1Radius * math.cos(angle),
        cy + level1Radius * math.sin(angle),
      );

      nodes.add(
        Positioned(
          left: pos.dx - 75,
          top: pos.dy - 22,
          child: _SkeletonNode(width: 150, height: 44),
        ),
      );
    }

    return nodes;
  }
}

// ─────────────────────────────────────────────────────────────
// Skeleton Node
// ─────────────────────────────────────────────────────────────
class _SkeletonNode extends StatelessWidget {
  final double width;
  final double height;

  const _SkeletonNode({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Generate MindMap Button
// ─────────────────────────────────────────────────────────────
class _GenerateMindMapButton extends StatelessWidget {
  final VoidCallback onTap;

  const _GenerateMindMapButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Generate MindMap',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Skeleton Painter (dashed radial lines)
// ─────────────────────────────────────────────────────────────
class _SkeletonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const double cx = _RadialLayoutEngine.canvasSize / 2;
    const double cy = _RadialLayoutEngine.canvasSize / 2;
    const double radius = 240.0;
    const int count = 6;

    for (int i = 0; i < count; i++) {
      final angle = (2 * math.pi * i) / count - math.pi / 2;
      final x = cx + radius * math.cos(angle);
      final y = cy + radius * math.sin(angle);
      _drawDashedLine(canvas, paint, Offset(cx, cy), Offset(x, y));
    }
  }

  void _drawDashedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    const double dashLength = 8.0;
    const double gapLength = 5.0;

    final double total = (end - start).distance;
    final Offset dir = (end - start) / total;
    double drawn = 0;
    bool isDash = true;

    while (drawn < total) {
      final double segmentLength = isDash ? dashLength : gapLength;
      final double next = (drawn + segmentLength).clamp(0.0, total);
      if (isDash) {
        canvas.drawLine(start + dir * drawn, start + dir * next, paint);
      }
      drawn = next;
      isDash = !isDash;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────
// Minimal stub so the file compiles standalone.
// Remove this if _RadialLayoutEngine is already imported
// from article_mind_map.dart
// ─────────────────────────────────────────────────────────────
class _RadialLayoutEngine {
  static const double canvasSize = 1300.0;
}
