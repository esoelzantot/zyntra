import 'package:flutter/material.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';
import 'package:zyntra/core/widgets/custom_divider.dart';

class ArticleMobileHeroLoading extends StatelessWidget {
  const ArticleMobileHeroLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Title ──────────────────────────────────────────────
        CustomFadingWidget.line(
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: 44,
          radius: 8,
        ),
        const SizedBox(height: 10),
        CustomFadingWidget.line(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: 44,
          radius: 8,
        ),

        const SizedBox(height: 24),

        // ── Authors + Buttons row ───────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: authors & date
            FittedBox(
              fit: BoxFit.scaleDown,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFadingWidget.line(width: 260, height: 20),
                  const SizedBox(height: 10),
                  CustomFadingWidget.line(width: 180, height: 16),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Right: action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFadingWidget.box(width: 110, height: 40),
                const SizedBox(width: 12),
                CustomFadingWidget.box(width: 110, height: 40),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        // ── Topics chips ────────────────────────────────────────
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [80.0, 110.0, 70.0, 95.0]
              .map(
                (w) => CustomFadingWidget.box(
                  width: w,
                  height: 30,
                  borderRadius: BorderRadius.circular(20),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 20),

        // ── Bottom divider ──────────────────────────────────────
        const CustomDivider(),
      ],
    );
  }
}
