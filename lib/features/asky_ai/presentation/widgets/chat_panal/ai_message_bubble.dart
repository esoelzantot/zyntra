import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

import '../../../../../app_theme.dart';
import '../../../../../core/data/asky_dummy_data.dart';

class AiMessageBubble extends StatelessWidget {
  final AiMessage message;

  const AiMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI avatar icon
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: const Center(
              child: Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.orange,
                size: 15,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Message bubble
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main text with optional link highlight
                      _buildMessageText(text: message.text, context: context),
                    ],
                  ),
                ),
                // Sender + time
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 2),
                  child: Text(
                    '${message.sender} · ${message.time}',
                    style: AppStyles.styleSemiBold14(
                      context,
                    ).copyWith(color: AppColors.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageText({
    required String text,
    required BuildContext context,
  }) {
    // Highlight "Cortex Systems Mapping X1" as a link
    const linkText = 'Cortex Systems Mapping X1';
    if (text.contains(linkText)) {
      final parts = text.split(linkText);
      return RichText(
        text: TextSpan(
          style: AppStyles.styleRegular16(
            context,
          ).copyWith(color: Colors.white),
          children: [
            TextSpan(text: parts[0]),
            TextSpan(
              text: linkText,
              style: const TextStyle(
                color: AppColors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (parts.length > 1) TextSpan(text: parts[1]),
          ],
        ),
      );
    }
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 13.5,
        height: 1.65,
      ),
    );
  }
}
