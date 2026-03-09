import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/widgets/footer/custom_footer_horizontal.dart';
import 'package:zyntra/core/widgets/header/custom_web_header.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/article_details_hero_section.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_main_content.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/article_side_content.dart';

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
                  horizontal: DesignConstants.defaultPage_HP,
                ),
                child: ArticleDetailsHeroSection(
                  title: 'MHC Diversity Across Time and Space',
                  authors: const [
                    'Cortazar‑Chinarro Maria',
                    'King Kayla C.',
                    'Lillie Mette',
                  ],
                  publishedDate: DateTime(2025, 4, 28),
                  publisherName: 'Nature Genetics Review',
                  topics: const [
                    'Conservation Biology',
                    'Evolutionary Biology',
                    'Population Genetics',
                    'Immunogenetics',
                  ],
                  onViewPdf: () => debugPrint('View PDF tapped'),
                  onVisitLink: () => debugPrint('Visit Live Link tapped'),
                ),
              ),

              SizedBox(height: 32),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DesignConstants.defaultPage_HP,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: ArticleMainContent()),
                    const SizedBox(width: 48),
                    Expanded(flex: 1, child: ArticleSideContent()),
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
