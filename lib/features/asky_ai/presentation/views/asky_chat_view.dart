import 'package:flutter/material.dart';
import 'package:zyntra/core/layouts/adaptive_layout.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/layouts/asky_chat_mobile_layout.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/layouts/asky_chat_tablet_layout.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/layouts/asky_chat_web_layout.dart';

class AskyChatView extends StatelessWidget {
  const AskyChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => AskyChatMobileLayout(),
        tabletLayout: (context) => AskyChatTabletLayout(),
        desktopLayout: (context) => AskyChatWebLayout(),
      ),
    );
  }
}
