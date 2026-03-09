import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class RelevantFields extends StatelessWidget {
  final List<String> fields;

  const RelevantFields({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──────────────────────────────────────────
        Text(
          'RELEVANT FIELDS',
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),

        const SizedBox(height: 12),

        // ── Wrap ───────────────────────────────────────────
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: fields.map((field) => _FieldCard(title: field)).toList(),
        ),
      ],
    );
  }
}

class _FieldCard extends StatefulWidget {
  final String title;

  const _FieldCard({required this.title});

  @override
  State<_FieldCard> createState() => _FieldCardState();
}

class _FieldCardState extends State<_FieldCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.title,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      textStyle: AppStyles.styleSemiBold12(
        context,
      ).copyWith(color: Colors.white, letterSpacing: 0.2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      preferBelow: false,
      waitDuration: const Duration(milliseconds: 100),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFFFFF7ED)
                : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFFF97316)
                  : const Color(0xFFE2E8F0),
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFFF97316).withValues(alpha: 0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Dot indicator ──────────────────────────
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? const Color(0xFFF97316)
                      : const Color(0xFFCBD5E1),
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 8),

              // ── Title ───────────────────────────────────
              Text(
                widget.title,
                style: AppStyles.styleSemiBold14(context).copyWith(
                  color: _isHovered
                      ? const Color(0xFFF97316)
                      : const Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
