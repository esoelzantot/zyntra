import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/mind_map_header.dart';

class MindMapLoadingIndicator extends StatelessWidget {
  const MindMapLoadingIndicator({super.key});

  // ── Layout constants (must match _RadialLayoutEngine exactly) ──
  static const double _canvasSize = _RadialLayoutEngine.canvasSize;
  static const double _cx = _canvasSize / 2;
  static const double _cy = _canvasSize / 2;

  static const double _level1Radius = 240.0;
  static const double _level2Gap = 200.0;

  static const double _nodeW = 150.0;
  static const double _nodeH = 56.0;

  static const int _l1Count = 6;

  static const double _visibleHeight = 350.0;

  // ── Pre-compute L1 positions ───────────────────────────────────
  static List<Offset> get _l1Centers {
    return List.generate(_l1Count, (i) {
      final angle = (2 * math.pi * i) / _l1Count - math.pi / 2;
      return Offset(
        _cx + _level1Radius * math.cos(angle),
        _cy + _level1Radius * math.sin(angle),
      );
    });
  }

  // Each L1 node gets 2 sub-children spread around the parent angle
  static List<Offset> _l2Centers(Offset parentCenter, double parentAngle) {
    const double spread = 0.9;
    const int subCount = 2;
    return List.generate(subCount, (j) {
      final angle = parentAngle - spread / 2 + (spread * j) / (subCount - 1);
      return Offset(
        parentCenter.dx + _level2Gap * math.cos(angle),
        parentCenter.dy + _level2Gap * math.sin(angle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l1Centers = _l1Centers;

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
                    // ── Connection lines ──────────────────────────────
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _LoadingConnectionPainter(
                          l1Centers: l1Centers,
                          l1Count: _l1Count,
                        ),
                      ),
                    ),

                    // ── Root node ─────────────────────────────────────
                    _fadingNode(
                      left: _cx - _nodeW / 2,
                      top: _cy - _nodeH / 2,
                      width: _nodeW,
                      height: _nodeH,
                      delay: Duration.zero,
                    ),

                    // ── L1 nodes ──────────────────────────────────────
                    ...List.generate(_l1Count, (i) {
                      final center = l1Centers[i];
                      return _fadingNode(
                        left: center.dx - _nodeW / 2,
                        top: center.dy - _nodeH / 2,
                        width: _nodeW,
                        height: _nodeH,
                        delay: Duration(milliseconds: 100 * i),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fadingNode({
    required double left,
    required double top,
    required double width,
    required double height,
    required Duration delay,
    bool isSubNode = false,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: _DelayedFadingNode(
        width: width,
        height: height,
        delay: delay,
        isSubNode: isSubNode,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Delayed fading wrapper — staggers each node's animation start
// ─────────────────────────────────────────────────────────────
class _DelayedFadingNode extends StatefulWidget {
  const _DelayedFadingNode({
    required this.width,
    required this.height,
    required this.delay,
    required this.isSubNode,
  });

  final double width;
  final double height;
  final Duration delay;
  final bool isSubNode;

  @override
  State<_DelayedFadingNode> createState() => _DelayedFadingNodeState();
}

class _DelayedFadingNodeState extends State<_DelayedFadingNode> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _visible = true;
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) setState(() => _visible = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) {
      return SizedBox(width: widget.width, height: widget.height);
    }

    return CustomFadingWidget(
      duration: Duration(milliseconds: widget.isSubNode ? 1200 : 900),
      minOpacity: widget.isSubNode ? 0.15 : 0.25,
      maxOpacity: widget.isSubNode ? 0.6 : 0.85,
      child: _MindMapSkeletonNode(
        width: widget.width,
        height: widget.height,
        isSubNode: widget.isSubNode,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Skeleton node shape (mimics MindMapNodeWidget container)
// ─────────────────────────────────────────────────────────────
class _MindMapSkeletonNode extends StatelessWidget {
  const _MindMapSkeletonNode({
    required this.width,
    required this.height,
    required this.isSubNode,
  });

  final double width;
  final double height;
  final bool isSubNode;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark
        ? const Color(0xFF2C2C2E)
        : const Color(0xFFE5E5EA);
    final borderColor = isDark
        ? const Color(0xFF3A3A3C)
        : const Color(0xFFD1D1D6);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(isSubNode ? 8 : 10),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFadingWidget.line(
            width: width * 0.65,
            height: isSubNode ? 10 : 12,
            radius: 6,
          ),
          if (!isSubNode) ...[
            const SizedBox(height: 6),
            CustomFadingWidget.line(width: width * 0.45, height: 9, radius: 5),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Connection lines painter (matches _RadialConnectionPainter)
// ─────────────────────────────────────────────────────────────
class _LoadingConnectionPainter extends CustomPainter {
  final List<Offset> l1Centers;
  final int l1Count;

  static const double _cx = MindMapLoadingIndicator._cx;
  static const double _cy = MindMapLoadingIndicator._cy;

  const _LoadingConnectionPainter({
    required this.l1Centers,
    required this.l1Count,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final l1Paint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final l2Paint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.13)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final root = Offset(_cx, _cy);

    for (int i = 0; i < l1Count; i++) {
      final l1Center = l1Centers[i];

      // Root → L1
      final path1 = Path();
      path1.moveTo(root.dx, root.dy);
      final mid1 = Offset(
        (root.dx + l1Center.dx) / 2,
        (root.dy + l1Center.dy) / 2,
      );
      path1.quadraticBezierTo(mid1.dx, mid1.dy, l1Center.dx, l1Center.dy);
      canvas.drawPath(path1, l1Paint);

      // L1 → L2
      final angle = (2 * math.pi * i) / l1Count - math.pi / 2;
      final subs = MindMapLoadingIndicator._l2Centers(l1Center, angle);
      for (final l2Center in subs) {
        final path2 = Path();
        path2.moveTo(l1Center.dx, l1Center.dy);
        final mid2 = Offset(
          (l1Center.dx + l2Center.dx) / 2,
          (l1Center.dy + l2Center.dy) / 2,
        );
        path2.quadraticBezierTo(mid2.dx, mid2.dy, l2Center.dx, l2Center.dy);
        canvas.drawPath(path2, l2Paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _LoadingConnectionPainter old) => false;
}

// ─────────────────────────────────────────────────────────────
// Stub — remove if already imported from article_mind_map.dart
// ─────────────────────────────────────────────────────────────
class _RadialLayoutEngine {
  static const double canvasSize = 1300.0;
}
