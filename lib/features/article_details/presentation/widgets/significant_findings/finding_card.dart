import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class FindingCard extends StatelessWidget {
  final String text;
  final int index;
  final int total;

  const FindingCard({
    super.key,
    required this.text,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Check icon ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE8621A),
                      width: 1.8,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      size: 15,
                      color: Color(0xFFE8621A),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              // ── Text ─────────────────────────────────────────
              Expanded(
                child: Text(
                  text,
                  style: AppStyles.styleRegular16(
                    context,
                  ).copyWith(color: Color(0xFF1A1A1A)),
                ),
              ),
            ],
          ),
        ),

        // Divider between cards (not after last)
        if (index < total - 1) const SizedBox(height: 10),
      ],
    );
  }
}
