import 'package:flutter/material.dart';
import 'package:zyntra/app_theme.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';

class ChatLoadingIndicator extends StatelessWidget {
  const ChatLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(28),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        final bool isUser = index.isOdd;
        return isUser
            ? const _UserMessageSkeleton()
            : const _AiMessageSkeleton();
      },
    );
  }
}

// ── User message skeleton ─────────────────────────────────────────────────────

class _UserMessageSkeleton extends StatelessWidget {
  const _UserMessageSkeleton();

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
                CustomFadingWidget.box(
                  width: 220,
                  height: 72,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                const SizedBox(height: 6),
                // Sender · time
                CustomFadingWidget.line(width: 90, height: 12),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Avatar
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

// ── AI message skeleton ───────────────────────────────────────────────────────

class _AiMessageSkeleton extends StatelessWidget {
  const _AiMessageSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bubble
                CustomFadingWidget.box(
                  height: 110,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                const SizedBox(height: 6),
                // Sender · time
                CustomFadingWidget.line(width: 90, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
