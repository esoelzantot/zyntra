import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class StatisticalSignificance extends StatelessWidget {
  final String body;

  const StatisticalSignificance({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Statistical Significance'.toUpperCase(),
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),
        const SizedBox(height: 8),

        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Left orange vertical bar ───────────────────────
              Container(
                width: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFFF97316),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(width: 14),

              // ── Content ────────────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Body
                    Text(
                      body,
                      style: AppStyles.styleMedium16(
                        context,
                      ).copyWith(color: Color(0xFF1E293B)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
