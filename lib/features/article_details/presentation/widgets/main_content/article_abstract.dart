import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ArticleAbstract extends StatelessWidget {
  final String abstractText;

  const ArticleAbstract({super.key, required this.abstractText});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF141E2E),
          border: Border(
            left: BorderSide(color: Color(0xFF007BFF), width: 4.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text('ABSTRACT', style: AppStyles.styleBold24(context)),

              const SizedBox(height: 16),

              // Body text
              Text(
                abstractText,
                style: AppStyles.styleRegular18(
                  context,
                ).copyWith(color: Color(0xFFB0BEC5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
