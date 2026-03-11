import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';

class ArticleSummaryAndConclusionLoading extends StatelessWidget {
  const ArticleSummaryAndConclusionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width <= SizeConfig.tablet;

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SummaryLoading(),
              const SizedBox(height: 24),
              const _ConclusionLoading(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: _SummaryLoading()),
              const SizedBox(width: 32),
              const Expanded(child: _ConclusionLoading()),
            ],
          );
  }
}

// ─────────────────────────────────────────────────────────────
// Summary skeleton — mirrors ArticleSummary bullet list
// ─────────────────────────────────────────────────────────────
class _SummaryLoading extends StatelessWidget {
  const _SummaryLoading();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        CustomFadingWidget.line(width: 110, height: 24, radius: 6),

        const SizedBox(height: 20),

        // Bullet rows (icon + text lines)
        ...List.generate(4, (_) => const _SummaryBulletLoading()),
      ],
    );
  }
}

class _SummaryBulletLoading extends StatelessWidget {
  const _SummaryBulletLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon placeholder
          CustomFadingWidget.circle(radius: 10),
          const SizedBox(width: 12),
          // Text lines
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [null, null, 180.0]
                  .map(
                    (w) => Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: CustomFadingWidget.line(
                        width: w,
                        height: 16,
                        radius: 4,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Conclusion skeleton — mirrors ArticleConclusion card
// ─────────────────────────────────────────────────────────────
class _ConclusionLoading extends StatelessWidget {
  const _ConclusionLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2235),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          CustomFadingWidget.line(width: 130, height: 24, radius: 6),

          const SizedBox(height: 20),

          // Body lines
          ...const [null, null, null, null, 200.0].map(
            (w) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CustomFadingWidget.line(width: w, height: 16, radius: 4),
            ),
          ),
        ],
      ),
    );
  }
}
