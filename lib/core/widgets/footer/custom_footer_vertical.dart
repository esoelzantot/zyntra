import 'package:flutter/material.dart';
import 'package:zyntra/core/functions/launch_url.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/footer/copyright_bar.dart';
import 'package:zyntra/core/widgets/footer/custom_icon_button.dart';

class CustomFooterVertical extends StatelessWidget {
  const CustomFooterVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.only(top: 10),
      color: const Color(0xFF000000).withValues(alpha: 0.20),
      child: Column(
        children: [
          // ── Top Nav Bar ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo + Brand
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE07B39),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.science_outlined,
                        color: Color(0xFFF5F5F5),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zyntra Biology Space',
                          style: AppStyles.styleBold24(context),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'FUTURE OF ASTROBIOLOGY',
                          style: AppStyles.styleSemiBold14(
                            context,
                          ).copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 16),
                // Action Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(
                      icon: AppAssets.facebookIcon,
                      onTap: () =>
                          launchUrlFunc("https://www.facebook.com/NASA"),
                    ),
                    const SizedBox(width: 10),
                    CustomIconButton(
                      icon: AppAssets.youtubeIcon,
                      onTap: () =>
                          launchUrlFunc("https://www.youtube.com/@NASA"),
                    ),
                    const SizedBox(width: 10),
                    CustomIconButton(
                      icon: AppAssets.websiteIcon,
                      onTap: () => launchUrlFunc("https://www.nasa.gov/"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Divider ──
          SizedBox(height: 10),
          Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffFFFFFF).withValues(alpha: 0.025),
          ),

          // ── Copyright Bar ──
          CopyrightBar(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ── Helper Widgets ─────────────────────────────────────────────────────────────

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: AppStyles.styleSemiBold18(context).copyWith(
            color: _hovered ? Color(0xffE07B39) : Colors.grey.shade600,
            decoration: _hovered
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
