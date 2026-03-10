import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

import '../../../../../app_theme.dart';
import '../../../../../core/data/asky_dummy_data.dart';

class UserMessageBubble extends StatelessWidget {
  final UserMessage message;

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
                    message.text,
                    style: AppStyles.styleRegular16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
                // Sender + time
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 2),
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
