import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResearchLimitations extends StatelessWidget {
  final List<String> limitations;

  const ResearchLimitations({super.key, required this.limitations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'LIMITATIONS',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 16),

        // ── Items ──────────────────────────────────────────
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: limitations.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) =>
              _LimitationItem(text: limitations[index]),
        ),
      ],
    );
  }
}

class _LimitationItem extends StatelessWidget {
  final String text;

  const _LimitationItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Warning dot ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              Icons.warning_amber_rounded,
              size: 20,
              color: Color(0xFFF59E0B),
            ),
          ),

          const SizedBox(width: 12),

          // ── Text ─────────────────────────────────────────
          Expanded(
            child: Text(
              text,
              style: AppStyles.styleMedium14(
                context,
              ).copyWith(color: const Color(0xFF78350F)),
            ),
          ),
        ],
      ),
    );
  }
}
