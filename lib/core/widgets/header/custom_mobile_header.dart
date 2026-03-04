import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';

class CustomMobileHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onMenuTap; // ✅ callback بدل Scaffold.of(context)

  const CustomMobileHeader({super.key, this.onMenuTap});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffc2c2c2).withAlpha(25),
        borderRadius: BorderRadius.circular(
          DesignConstants.defaultBorderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            /// ── Drawer Icon Button ──
            GestureDetector(
              onTap: onMenuTap, // ✅ بدل Scaffold.of(context).openDrawer()
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),

            const Spacer(),

            /// ── Logo Icon ──
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE84E1B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.biotech_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),

            const SizedBox(width: 10),

            /// ── Brand Name ──
            const Text(
              'ZYNTRA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
