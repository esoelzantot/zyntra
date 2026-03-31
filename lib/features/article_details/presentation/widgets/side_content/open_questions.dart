import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class OpenQuestions extends StatelessWidget {
  final List<String> questions;

  const OpenQuestions({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'OPEN QUESTIONS',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 12),

        // ── Questions List ─────────────────────────────────
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) =>
              _QuestionCard(index: index + 1, question: questions[index]),
        ),
      ],
    );
  }
}

class _QuestionCard extends StatefulWidget {
  final int index;
  final String question;

  const _QuestionCard({required this.index, required this.question});

  @override
  State<_QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<_QuestionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isHovered ? const Color(0xFFFFF7ED) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFFF97316)
                : const Color(0xFFE2E8F0),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFFF97316).withOpacity(0.10),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Index Badge ──────────────────────────────
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: _isHovered
                    ? const Color(0xFFF97316)
                    : const Color(0xFFE2E8F0),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${widget.index}',
                  style: AppStyles.styleBold16(context).copyWith(
                    color: _isHovered ? Colors.white : const Color(0xFF94A3B8),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ── Question Text ────────────────────────────
            Expanded(
              child: SelectableText(
                widget.question,
                style: AppStyles.styleMedium16(
                  context,
                ).copyWith(color: const Color(0xFF475569)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
