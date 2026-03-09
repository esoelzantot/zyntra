import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ArticleSummary extends StatelessWidget {
  final String text;
  const ArticleSummary({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Double-check icon
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.done_all_rounded,
              size: 20,
              color: Colors.blue[400],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppStyles.styleRegular18(
                context,
              ).copyWith(color: Color(0xFFB0BEC5)),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
