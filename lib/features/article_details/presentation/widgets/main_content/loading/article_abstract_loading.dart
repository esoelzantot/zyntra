import 'package:flutter/material.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';

class ArticleAbstractLoading extends StatelessWidget {
  const ArticleAbstractLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF141E2E),
          border: Border(
            left: BorderSide(color: Color(0xFF007BFF), width: 4.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Title ───────────────────────────────────────────
            CustomFadingWidget.line(width: 130, height: 28, radius: 6),

            const SizedBox(height: 20),

            // ── Body lines ──────────────────────────────────────
            ...const [
              null, // full width
              null,
              null,
              null,
              280.0, // last line shorter
            ].map(
              (w) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomFadingWidget.line(width: w, height: 18, radius: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
