import 'package:flutter/material.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';

import 'chat_input_bar.dart';
import 'chat_messages_list.dart';
import 'chat_top_bar.dart';

class ChatPanel extends StatefulWidget {
  final ValueChanged<List<ResourceEntity>> onResourcesTap;

  const ChatPanel({super.key, required this.onResourcesTap});

  @override
  State<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatTopBar(),
        Expanded(
          child: ChatMessagesList(
            scrollController: _scrollController,
            onResourcesTap: widget.onResourcesTap,
          ),
        ),
        const ChatInputBar(),
      ],
    );
  }
}
