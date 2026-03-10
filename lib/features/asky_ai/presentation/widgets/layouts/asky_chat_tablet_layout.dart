import 'package:flutter/material.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/side_bar/asky_sidebar.dart';

import '../chat_panal/chat_panel.dart';

class AskyChatTabletLayout extends StatelessWidget {
  const AskyChatTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 1, child: AskySidebar()),
        Expanded(flex: 3, child: ChatPanel()),
      ],
    );
  }
}
