import 'package:flutter/material.dart';

import '../../../../../core/data/asky_dummy_data.dart';
import 'ai_message_bubble.dart';
import 'user_message_bubble.dart';

class ChatMessagesList extends StatelessWidget {
  final List<ChatMessage> messages;
  final ScrollController scrollController;

  const ChatMessagesList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(28),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        if (msg is AiMessage) {
          return AiMessageBubble(message: msg);
        } else if (msg is UserMessage) {
          return UserMessageBubble(message: msg);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
