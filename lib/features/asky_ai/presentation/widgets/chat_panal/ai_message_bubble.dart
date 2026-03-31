import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';

import '../../../../../app_theme.dart';

class AiMessageBubble extends StatelessWidget {
  final MessageEntity message;
  final ValueChanged<List<ResourceEntity>>? onResourcesTap;

  const AiMessageBubble({
    super.key,
    required this.message,
    required this.onResourcesTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onResourcesTap?.call(message.resources),
      child: Padding(
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
                    child: SelectionArea(
                      child: _buildMessageText(
                        text: message.content,
                        context: context,
                      ),
                    ),
                  ),
                  // Sender + time
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 2),
                    child: Text(
                      '${message.role} · ${message.date}',
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
      ),
    );
  }

  Widget _buildMessageText({
    required String text,
    required BuildContext context,
  }) {
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

    return SelectableText(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 13.5,
        height: 1.65,
      ),
    );
  }
}
