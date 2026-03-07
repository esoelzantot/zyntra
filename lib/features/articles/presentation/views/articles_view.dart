import 'package:flutter/material.dart';
import 'package:zyntra/core/layouts/adaptive_layout.dart';
import 'package:zyntra/features/articles/presentation/widgets/layouts/articles_view_mobile_layout.dart';
import 'package:zyntra/features/articles/presentation/widgets/layouts/articles_view_tablet_layout.dart';
import 'package:zyntra/features/articles/presentation/widgets/layouts/articles_view_web_layout.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => ArticlesViewMobileLayout(),
        tabletLayout: (context) => ArticlesViewTabletLayout(),
        desktopLayout: (context) => ArticlesViewWebLayout(),
      ),
    );
  }
}
