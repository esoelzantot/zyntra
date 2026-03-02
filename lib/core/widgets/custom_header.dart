import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  int _hoveredIndex = -1;

  static const _navItems = ['Asky', 'Articles', 'Home', 'Library', 'About'];

  static const _textColor = Color(0xFFE5E5E5);
  static const _mutedText = Color(0xFF9A9A9A);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFffffff).withAlpha(25),
        borderRadius: BorderRadius.circular(
          DesignConstants.defaultBorderRadius,
        ),
      ),
      child: Row(
        children: [
          // ── Nav Items ─────────────────────────────────────────
          Row(
            children: List.generate(_navItems.length, (i) {
              final isHovered = _hoveredIndex == i;
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _hoveredIndex = i),
                onExit: (_) => setState(() => _hoveredIndex = -1),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 100),
                  style: AppStyles.styleSemiBold18(context).copyWith(
                    color: isHovered ? _textColor : _mutedText,
                    fontSize: isHovered ? 20 : 18,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Text(_navItems[i]),
                        if (isHovered)
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _textColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),

          const Spacer(),

          // ── Logo ──────────────────────────────────────────────
          _ZyntraLogo(),
        ],
      ),
    );
  }
}

// ── Zyntra Logo ───────────────────────────────────────────────────────────────

class _ZyntraLogo extends StatelessWidget {
  const _ZyntraLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Orange icon badge
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFE8510A),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'ZYNTRA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
      ],
    );
  }
}
