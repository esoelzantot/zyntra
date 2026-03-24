import 'package:flutter/material.dart';
import 'package:zyntra/core/data/articles_images.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/widgets/article_card/article_card.dart';

class LibraryGridView extends StatelessWidget {
  const LibraryGridView({
    super.key,
    required this.articles,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  final List<ArticleEntity> articles;
  final int crossAxisCount;
  final double childAspectRatio;

  final List<String> images = articlesImages;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: articles.length,
      itemBuilder: (_, i) {
        return ArticleCard(article: articles[i], imageUrl: images[i]);
      },
    );
  }
}
