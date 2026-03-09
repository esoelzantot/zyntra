import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResearchMechanisms extends StatelessWidget {
  final List<String> mechanisms;

  const ResearchMechanisms({super.key, required this.mechanisms});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'MECHANISMS',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 16),

        // ── Mechanisms ─────────────────────────────────────
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
          itemCount: mechanisms.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _MechanismItem(
              text: mechanisms[index],
              isLast: index == mechanisms.length - 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _MechanismItem extends StatelessWidget {
  final String text;
  final bool isLast;

  const _MechanismItem({required this.text, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Gear icon ──────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.settings_outlined,
                  size: 20,
                  color: const Color(0xFFF97316),
                ),
              ),

              const SizedBox(width: 12),

              // ── Full text ──────────────────────────────
              Expanded(
                child: Text(
                  text,
                  style: AppStyles.styleMedium14(
                    context,
                  ).copyWith(color: const Color(0xFF475569)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
