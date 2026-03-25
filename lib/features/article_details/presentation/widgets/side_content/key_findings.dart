import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class KeyFindings extends StatelessWidget {
  final List<String> findings;

  const KeyFindings({super.key, required this.findings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'KEY FINDINGS',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 16),

        // ── Findings List ──────────────────────────────────
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: findings.length,
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
              _FindingItem(index: index + 1, finding: findings[index]),
        ),
      ],
    );
  }
}

class _FindingItem extends StatelessWidget {
  final int index;
  final String finding;

  const _FindingItem({required this.index, required this.finding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Index ────────────────────────────────────────
          Text(
            (index < 10) ? '0$index' : '$index',
            style: AppStyles.styleBold24(
              context,
            ).copyWith(color: const Color(0xFFF97316)),
          ),

          const SizedBox(width: 14),

          // ── Finding Text ─────────────────────────────────
          Expanded(
            child: Text(
              finding,
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
