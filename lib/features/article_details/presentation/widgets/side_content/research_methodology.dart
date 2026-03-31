import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResearchMethodology extends StatelessWidget {
  final List<String> methodology;

  const ResearchMethodology({super.key, required this.methodology});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'METHODOLOGY',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 16),

        // ── Steps ──────────────────────────────────────────
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: methodology.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _MethodStep(
              index: index,
              text: methodology[index],
              isLast: index == methodology.length - 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _MethodStep extends StatelessWidget {
  final int index;
  final String text;
  final bool isLast;

  const _MethodStep({
    required this.index,
    required this.text,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timeline column ───────────────────────────
          SizedBox(
            width: 32,
            child: Column(
              children: [
                // Step circle
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF97316),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),

                // Connector line (hidden for last item)
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

          // ── Content ──────────────────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20, top: 4),
              child: SelectableText(
                text,
                style: AppStyles.styleMedium14(
                  context,
                ).copyWith(color: const Color(0xFF475569)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
