import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/article_card/article_card_copy.dart';

class LibraryGridLoadingIndicator extends StatelessWidget {
  const LibraryGridLoadingIndicator({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.pageSize,
  });

  final int crossAxisCount;
  final int pageSize;
  final double childAspectRatio;

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
      itemCount: pageSize,
      itemBuilder: (_, i) {
        return ArticleCardCopy();
      },
    );
  }
}
