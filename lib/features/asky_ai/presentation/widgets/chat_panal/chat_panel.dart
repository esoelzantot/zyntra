import 'package:flutter/material.dart';

import '../../../../../core/data/asky_dummy_data.dart';
import 'chat_input_bar.dart';
import 'chat_messages_list.dart';
import 'chat_top_bar.dart';

class ChatPanel extends StatefulWidget {
  const ChatPanel({super.key});

  @override
  State<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  final _scrollController = ScrollController();
  final _messages = SampleData.messages;

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
            messages: _messages,
            scrollController: _scrollController,
          ),
        ),
        const ChatInputBar(),
      ],
    );
  }
}
