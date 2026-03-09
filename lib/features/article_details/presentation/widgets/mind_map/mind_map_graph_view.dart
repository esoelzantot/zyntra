import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_mind_map.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/mind_map_node_widget.dart';

class MindMapGraphView extends StatelessWidget {
  final MindMapNode root;
  final Map<String, MindMapNode> nodeDataMap;
  final String? selectedNodeId;
  final void Function(String id) onNodeTap;

  const MindMapGraphView({
    super.key,
    required this.root,
    required this.nodeDataMap,
    required this.selectedNodeId,
    required this.onNodeTap,
  });

  @override
  Widget build(BuildContext context) {
    final engine = _RadialLayoutEngine(root)..compute();
    const double nodeW = 150;
    const double nodeH = 56;
    const double canvasSize = _RadialLayoutEngine.canvasSize;

    return SizedBox(
      width: canvasSize,
      height: canvasSize,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _RadialConnectionPainter(
                layouts: engine.layouts,
                root: root,
              ),
            ),
          ),
          ...engine.layouts.values.map((layout) {
            return Positioned(
              left: layout.center.dx - nodeW / 2,
              top: layout.center.dy - nodeH / 2,
              width: nodeW,
              child: MindMapNodeWidget(
                data: layout.node,
                isSelected: selectedNodeId == layout.node.id,
                onTap: () => onNodeTap(layout.node.id),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Radial layout engine  (pure Dart, no graphview dependency)
// ─────────────────────────────────────────────────────────────
class _NodeLayout {
  final MindMapNode node;
  final Offset center;
  const _NodeLayout({required this.node, required this.center});
}

class _RadialLayoutEngine {
  static const double _level1Radius = 240.0;
  static const double _level2Gap = 200.0;
  static const double canvasSize = 1300.0;

  final MindMapNode root;
  final Map<String, _NodeLayout> layouts = {};

  _RadialLayoutEngine(this.root);

  Offset get _center => const Offset(canvasSize / 2, canvasSize / 2);

  void compute() {
    layouts.clear();
    layouts[root.id] = _NodeLayout(node: root, center: _center);

    final children = root.children;
    final count = children.length;
    if (count == 0) return;

    for (int i = 0; i < count; i++) {
      final angle = (2 * math.pi * i) / count - math.pi / 2;
      final cx = _center.dx + _level1Radius * math.cos(angle);
      final cy = _center.dy + _level1Radius * math.sin(angle);
      final child = children[i];
      final childCenter = Offset(cx, cy);
      layouts[child.id] = _NodeLayout(node: child, center: childCenter);
      _layoutSubChildren(child, childCenter, angle);
    }
  }

  void _layoutSubChildren(
    MindMapNode parent,
    Offset parentCenter,
    double parentAngle,
  ) {
    final subs = parent.children;
    if (subs.isEmpty) return;
    const double spread = 0.9;
    final subCount = subs.length;
    for (int j = 0; j < subCount; j++) {
      final angle = subCount == 1
          ? parentAngle
          : parentAngle - spread / 2 + (spread * j) / (subCount - 1);
      final cx = parentCenter.dx + _level2Gap * math.cos(angle);
      final cy = parentCenter.dy + _level2Gap * math.sin(angle);
      layouts[subs[j].id] = _NodeLayout(node: subs[j], center: Offset(cx, cy));
    }
  }
}

// ─────────────────────────────────────────────────────────────
// Connection lines painter
// ─────────────────────────────────────────────────────────────
class _RadialConnectionPainter extends CustomPainter {
  final Map<String, _NodeLayout> layouts;
  final MindMapNode root;

  const _RadialConnectionPainter({required this.layouts, required this.root});

  @override
  void paint(Canvas canvas, Size size) => _drawEdges(canvas, root);

  void _drawEdges(Canvas canvas, MindMapNode parent) {
    final parentLayout = layouts[parent.id];
    if (parentLayout == null) return;
    for (final child in parent.children) {
      final childLayout = layouts[child.id];
      if (childLayout == null) continue;
      final paint = Paint()
        ..color = depthColor(child.depth).withValues(alpha: 0.4)
        ..strokeWidth = child.depth == 1 ? 2.0 : 1.2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      final path = Path();
      path.moveTo(parentLayout.center.dx, parentLayout.center.dy);
      final mid = Offset(
        (parentLayout.center.dx + childLayout.center.dx) / 2,
        (parentLayout.center.dy + childLayout.center.dy) / 2,
      );
      path.quadraticBezierTo(
        mid.dx,
        mid.dy,
        childLayout.center.dx,
        childLayout.center.dy,
      );
      canvas.drawPath(path, paint);
      _drawEdges(canvas, child);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
