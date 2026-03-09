import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class TopicChip extends StatefulWidget {
  final String label;
  final int index;

  const TopicChip({super.key, required this.label, required this.index});

  @override
  State<TopicChip> createState() => _TopicChipState();
}

class _TopicChipState extends State<TopicChip>
    with SingleTickerProviderStateMixin {
  // ── Entrance controller ──────────────────────────────────────
  late final AnimationController _entranceCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  // ── Hover state ──────────────────────────────────────────────
  bool _hovered = false;

  static const _kEntranceDuration = Duration(milliseconds: 450);
  static const _kStaggerStep = Duration(milliseconds: 80);

  @override
  void initState() {
    super.initState();

    _entranceCtrl = AnimationController(
      vsync: this,
      duration: _kEntranceDuration,
    );

    _fadeAnim = CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.35), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _entranceCtrl, curve: Curves.easeOutCubic),
        );

    // Staggered delay per chip index
    Future.delayed(_kStaggerStep * widget.index, () {
      if (mounted) _entranceCtrl.forward();
    });
  }

  @override
  void dispose() {
    _entranceCtrl.dispose();
    super.dispose();
  }

  // ── Colors ───────────────────────────────────────────────────
  static const _borderDefault = Color(0xFFCCCCCC);
  static const _borderPressed = Color(0xFF0D1B2E);
  static const _bgPressed = Color(0xFF0D1B2E);
  static const _textDefault = Colors.white;
  static const _textPressed = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: AnimatedScale(
            scale: _hovered ? 0.93 : 1.0,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _hovered ? _bgPressed : Colors.transparent,
                border: Border.all(
                  color: _hovered ? _borderPressed : _borderDefault,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: AppStyles.styleMedium14(
                  context,
                ).copyWith(color: _hovered ? _textPressed : _textDefault),
                child: Text(widget.label),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
