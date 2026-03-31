import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResearchImplications extends StatelessWidget {
  final List<String> implications;

  const ResearchImplications({super.key, required this.implications});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'IMPLICATIONS',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 16),

        // ── Items ──────────────────────────────────────────
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: implications.length,
          separatorBuilder: (_, __) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xFFE2E8F0),
              thickness: 0.5,
              height: 0.5,
              indent: 80,
              endIndent: 80,
            ),
          ),
          itemBuilder: (context, index) =>
              _ImplicationItem(text: implications[index]),
        ),
      ],
    );
  }
}

class _ImplicationItem extends StatelessWidget {
  final String text;

  const _ImplicationItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Arrow indicator ──────────────────────────────
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: const Color(0xFFF97316),
            ),
          ),

          const SizedBox(width: 12),

          // ── Text ─────────────────────────────────────────
          Expanded(
            child: SelectableText(
              text,
              style: AppStyles.styleMedium16(
                context,
              ).copyWith(color: const Color(0xFF475569)),
            ),
          ),
        ],
      ),
    );
  }
}
