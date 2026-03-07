import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/routing/end_points.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CustomWebHeader extends StatefulWidget {
  const CustomWebHeader({super.key});

  @override
  State<CustomWebHeader> createState() => _CustomWebHeaderState();
}

class _CustomWebHeaderState extends State<CustomWebHeader> {
  int _hoveredIndex = -1;

  static const _navItems = ['Home', 'Asky', 'Articles', 'Library', 'About'];

  static const _textColor = Color(0xFFE5E5E5);
  static const _mutedText = Color(0xFF9A9A9A);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xffc2c2c2).withAlpha(25),
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
                        GestureDetector(
                          onTap: () => _handleNavigation(i),
                          child: Text(_navItems[i]),
                        ),
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

  // ── Navigation Handle ───────────────────────────────────────────────────────────────
  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).push(EndPoints.homeView);
        break;
      case 2:
        GoRouter.of(context).push(EndPoints.articlesView);
        break;
      default:
    }
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
