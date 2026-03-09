import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResearchQuestion extends StatelessWidget {
  final String question;

  const ResearchQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Label ─────────────────────────────────────────
        Text(
          'RESEARCH QUESTION',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 8),

        // ── Question ───────────────────────────────────────
        Text(
          question,
          style: AppStyles.styleMedium16(
            context,
          ).copyWith(color: Colors.black87),
        ),
      ],
    );
  }
}
