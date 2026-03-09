import 'package:flutter/material.dart';
import 'package:zyntra/core/layouts/adaptive_layout.dart';
import 'package:zyntra/features/article_details/presentation/widgets/layouts/article_details_mobile_layout.dart';
import 'package:zyntra/features/article_details/presentation/widgets/layouts/article_details_tablet_layout.dart';
import 'package:zyntra/features/article_details/presentation/widgets/layouts/article_details_web_layout.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => ArticleDetailsMobileLayout(),
        tabletLayout: (context) => ArticleDetailsTabletLayout(),
        desktopLayout: (context) => ArticleDetailsWebLayout(),
      ),
    );
  }
}
