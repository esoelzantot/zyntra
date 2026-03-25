import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_horizontal.dart';
import 'package:zyntra/core/widgets/header/custom_web_header.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/article_web_hero_bloc_consumer.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_main_content_bloc_consumer.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/article_side_content_bloc_consumer.dart';

class ArticleDetailsWebLayout extends StatelessWidget {
  const ArticleDetailsWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100), // Space for the header

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DesignConstants.defaultWeb_HP,
                ),
                child: ArticleWebHeroBlocConsumer(),
              ),

              SizedBox(height: 32),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DesignConstants.defaultWeb_HP,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: ArticleMainContentBlocConsumer()),
                    const SizedBox(width: 48),
                    Expanded(flex: 1, child: ArticleSideContentBlocConsumer()),
                  ],
                ),
              ),

              const CustomFooterHorizontal(),
            ],
          ),
        ),

        Positioned(top: 0, left: 0, right: 0, child: CustomWebHeader()),
      ],
    );
  }
}
