import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';
import 'package:zyntra/features/asky_ai/presentation/cubits/get_messages/get_messages_cubit.dart';

import 'ai_message_bubble.dart';
import 'chat_loading_indicator.dart';
import 'empty_chat_widget.dart';
import 'user_message_bubble.dart';

class ChatMessagesList extends StatefulWidget {
  final ScrollController scrollController;
  final ValueChanged<List<ResourceEntity>> onResourcesTap;

  const ChatMessagesList({
    super.key,
    required this.scrollController,
    required this.onResourcesTap,
  });

  @override
  State<ChatMessagesList> createState() => _ChatMessagesListState();
}

class _ChatMessagesListState extends State<ChatMessagesList> {
  @override
  void initState() {
    super.initState();
    context.read<GetMessagesCubit>().getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMessagesCubit, GetMessagesState>(
      builder: (context, state) {
        if (state is GetMessagesLoading) {
          return const ChatLoadingIndicator();
        }

        if (state is GetMessagesFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white38,
                  size: 32,
                ),
                const SizedBox(height: 12),
                Text(
                  state.message,
                  style: const TextStyle(color: Colors.white38, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (state is GetMessagesSuccess) {
          final List<MessageEntity> messages = state.messages;

          if (messages.isEmpty) return const EmptyChatWidget();

          return ListView.builder(
            controller: widget.scrollController,
            padding: const EdgeInsets.all(28),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final MessageEntity msg = messages[index];
              if (msg.role == 'asky') {
                return AiMessageBubble(
                  message: msg,
                  onResourcesTap: widget.onResourcesTap,
                );
              } else {
                return UserMessageBubble(message: msg);
              }
            },
          );
        }

        return const EmptyChatWidget();
      },
    );
  }
}
