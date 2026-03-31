import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';

import '../../../../../app_theme.dart';

class UserMessageBubble extends StatelessWidget {
  final MessageEntity message;

  const UserMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Bubble
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    message.content,
                    style: AppStyles.styleRegular16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
                // Sender + time
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 2),
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
          const SizedBox(width: 10),
          // User avatar
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppColors.orange,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
