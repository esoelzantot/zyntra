import 'package:flutter/material.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';
import 'package:zyntra/core/widgets/custom_divider.dart';

class ArticleSideContentLoading extends StatelessWidget {
  const ArticleSideContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header ────────────────────────────────────────────
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF97316), width: 2),
                ),
                child: const Icon(
                  Icons.psychology_outlined,
                  color: Color(0xFFF97316),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              CustomFadingWidget.line(width: 180, height: 22, radius: 6),
            ],
          ),

          const SizedBox(height: 16),
          const CustomDivider(),
          const SizedBox(height: 16),

          // ── ResearchQuestion ──────────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 8),
          const _LinesLoading(lineCount: 2, lastLineWidth: 160),

          const SizedBox(height: 24),

          // ── StatisticalSignificance ───────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 8),
          const _StatisticalSignificanceLoading(),

          const SizedBox(height: 24),

          // ── RelevantFields ────────────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 12),
          const _RelevantFieldsLoading(),

          const SizedBox(height: 16),
          const CustomDivider(),
          const SizedBox(height: 16),

          // ── OpenQuestions ─────────────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 12),
          ...List.generate(3, (_) => const _QuestionCardLoading()),

          const SizedBox(height: 24),

          // ── KeyFindings ───────────────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 16),
          ...List.generate(3, (i) => _KeyFindingLoading(isLast: i == 2)),

          const SizedBox(height: 24),

          // ── ResearchImplications ──────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 16),
          ...List.generate(3, (i) => _IconRowLoading(isLast: i == 2)),

          const SizedBox(height: 24),

          // ── ResearchLimitations ───────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 16),
          ...List.generate(3, (_) => const _LimitationCardLoading()),

          const SizedBox(height: 16),
          const CustomDivider(),
          const SizedBox(height: 16),

          // ── ResearchMethodology ───────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 16),
          ...List.generate(4, (i) => _MethodStepLoading(isLast: i == 3)),

          const SizedBox(height: 24),

          // ── ResearchMechanisms ────────────────────────────────
          const _LabelLoading(),
          const SizedBox(height: 16),
          ...List.generate(3, (i) => _IconRowLoading(isLast: i == 2)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Shared primitives
// ─────────────────────────────────────────────────────────────

/// Uppercase section label skeleton (e.g. "RESEARCH QUESTION")
class _LabelLoading extends StatelessWidget {
  const _LabelLoading();

  @override
  Widget build(BuildContext context) =>
      CustomFadingWidget.line(width: 150, height: 14, radius: 4);
}

/// Multiple body text lines
class _LinesLoading extends StatelessWidget {
  final int lineCount;
  final double? lastLineWidth;

  const _LinesLoading({this.lineCount = 3, this.lastLineWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lineCount, (i) {
        final isLast = i == lineCount - 1;
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: CustomFadingWidget.line(
            width: isLast ? lastLineWidth : null,
            height: 15,
            radius: 4,
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// StatisticalSignificance — orange left bar + lines
// ─────────────────────────────────────────────────────────────
class _StatisticalSignificanceLoading extends StatelessWidget {
  const _StatisticalSignificanceLoading();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3,
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0xFFF97316),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(child: _LinesLoading(lineCount: 3, lastLineWidth: 140)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// RelevantFields — pill chips wrap
// ─────────────────────────────────────────────────────────────
class _RelevantFieldsLoading extends StatelessWidget {
  const _RelevantFieldsLoading();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [90.0, 120.0, 75.0, 105.0, 85.0]
          .map(
            (w) => CustomFadingWidget.box(
              width: w,
              height: 36,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          )
          .toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// OpenQuestions — card with circle badge + lines
// ─────────────────────────────────────────────────────────────
class _QuestionCardLoading extends StatelessWidget {
  const _QuestionCardLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFadingWidget.circle(radius: 14),
            const SizedBox(width: 12),
            const Expanded(
              child: _LinesLoading(lineCount: 2, lastLineWidth: 160),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// KeyFindings — orange index number + lines + divider
// ─────────────────────────────────────────────────────────────
class _KeyFindingLoading extends StatelessWidget {
  final bool isLast;

  const _KeyFindingLoading({required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFadingWidget.line(width: 28, height: 28, radius: 4),
              const SizedBox(width: 14),
              const Expanded(
                child: _LinesLoading(lineCount: 2, lastLineWidth: 180),
              ),
            ],
          ),
        ),
        if (!isLast)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xFFE2E8F0),
              thickness: 0.5,
              height: 0.5,
              indent: 80,
              endIndent: 80,
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Implications / Mechanisms — icon + lines + divider
// ─────────────────────────────────────────────────────────────
class _IconRowLoading extends StatelessWidget {
  final bool isLast;

  const _IconRowLoading({required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFadingWidget.circle(radius: 10),
              const SizedBox(width: 12),
              const Expanded(
                child: _LinesLoading(lineCount: 2, lastLineWidth: 150),
              ),
            ],
          ),
        ),
        if (!isLast)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xFFE2E8F0),
              thickness: 0.5,
              height: 0.5,
              indent: 80,
              endIndent: 80,
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// ResearchLimitations — bordered card with warning icon
// ─────────────────────────────────────────────────────────────
class _LimitationCardLoading extends StatelessWidget {
  const _LimitationCardLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFadingWidget.circle(radius: 10),
            const SizedBox(width: 12),
            const Expanded(
              child: _LinesLoading(lineCount: 2, lastLineWidth: 140),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// ResearchMethodology — timeline step (circle + connector + text)
// ─────────────────────────────────────────────────────────────
class _MethodStepLoading extends StatelessWidget {
  final bool isLast;

  const _MethodStepLoading({required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline column
            SizedBox(
              width: 32,
              child: Column(
                children: [
                  CustomFadingWidget.circle(radius: 14),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 20, top: 4),
                child: const _LinesLoading(lineCount: 2, lastLineWidth: 160),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
