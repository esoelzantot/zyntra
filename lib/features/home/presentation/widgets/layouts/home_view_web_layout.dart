import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/custom_header.dart';

class HomeViewWebLayout extends StatelessWidget {
  const HomeViewWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Scrollable Content ────────────────────────────────
        CustomScrollView(
          slivers: [
            // عشان المحتوى ميتغطاش بالـ header
            SliverToBoxAdapter(
              child: SizedBox(height: 90), // نفس ارتفاع الـ header
            ),

            // باقي المحتوى هنا
          ],
        ),

        // ── Fixed Header ──────────────────────────────────────
        Positioned(top: 0, left: 0, right: 0, child: CustomHeader()),
      ],
    );
  }
}
