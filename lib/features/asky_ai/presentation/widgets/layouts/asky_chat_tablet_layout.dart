import 'package:flutter/material.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/side_bar/asky_sidebar.dart';

import '../chat_panal/chat_panel.dart';

class AskyChatTabletLayout extends StatefulWidget {
  const AskyChatTabletLayout({super.key});

  @override
  State<AskyChatTabletLayout> createState() => _AskyChatTabletLayoutState();
}

class _AskyChatTabletLayoutState extends State<AskyChatTabletLayout> {
  List<ResourceEntity> _selectedResources = [];

  void _onResourcesTap(List<ResourceEntity> resources) {
    setState(() => _selectedResources = resources);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: AskySidebar(resources: _selectedResources)),
        Expanded(flex: 3, child: ChatPanel(onResourcesTap: _onResourcesTap)),
      ],
    );
  }
}
