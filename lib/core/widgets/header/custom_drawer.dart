import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routing/end_points.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CustomDrawer extends StatefulWidget {
  final VoidCallback? onClose;

  const CustomDrawer({super.key, this.onClose});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final Set<String> _expanded = {};

  final List<_DrawerItem> _items = const [
    _DrawerItem(label: 'Home', icon: Icons.home_rounded, hasArrow: false),
    _DrawerItem(label: 'Asky', icon: Icons.chat_rounded, hasArrow: false),
    _DrawerItem(
      label: 'Articles',
      icon: Icons.library_books_rounded,
      hasArrow: false,
    ),
    _DrawerItem(
      label: 'Library',
      icon: Icons.library_books_rounded,
      hasArrow: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withValues(alpha: 0.90),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ── Drawer Header ──
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Row(
              children: [
                /// Logo + Brand
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Zyntra',
                        style: AppStyles.styleBold30(
                          context,
                        ).copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Text(
                      'Space Biology',
                      style: AppStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Colors.white38),
                    ),
                  ],
                ),

                const Spacer(),

                /// Close Button
                GestureDetector(
                  onTap: widget.onClose,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// ── Nav Items ──
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final isExpanded = _expanded.contains(item.label);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      _handleNavigation(index);
                      if (item.hasArrow) {
                        setState(() {
                          isExpanded
                              ? _expanded.remove(item.label)
                              : _expanded.add(item.label);
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Color(0xFF007BFF).withAlpha(25),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          /// Icon Box
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.75,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              item.icon,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),

                          const SizedBox(width: 14),

                          /// Label
                          Text(
                            item.label,
                            style: AppStyles.styleSemiBold18(
                              context,
                            ).copyWith(color: Colors.white),
                          ),

                          const Spacer(),

                          /// Arrow
                          if (item.hasArrow)
                            AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 250),
                              child: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white38,
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
      case 1:
        GoRouter.of(context).push(EndPoints.askyView);
        break;
      case 2:
        GoRouter.of(context).push(EndPoints.articlesView);
        break;
      case 3:
        GoRouter.of(context).push(EndPoints.libraryView);
        break;
      default:
    }
  }
}

/// ─────────────────────────────────────────
///  Drawer Item Model
/// ─────────────────────────────────────────

class _DrawerItem {
  final String label;
  final IconData icon;
  final bool hasArrow;

  const _DrawerItem({
    required this.label,
    required this.icon,
    required this.hasArrow,
  });
}
