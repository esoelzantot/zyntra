import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CustomAnimatedButton extends StatefulWidget {
  final VoidCallback? onTap;

  final String title;

  const CustomAnimatedButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFFFF6B00).withAlpha(25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: AppStyles.styleSemiBold16(context).copyWith(
                  color: _hovered
                      ? const Color(0xFFFF8C00)
                      : const Color(0xFFFF6B00),
                  letterSpacing: _hovered ? 0.5 : 0,
                ),
                child: Text(widget.title),
              ),
              AnimatedSlide(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                offset: _hovered ? const Offset(0.3, 0) : Offset.zero,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: _hovered ? 1.0 : 0.7,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFFFF6B00),
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
