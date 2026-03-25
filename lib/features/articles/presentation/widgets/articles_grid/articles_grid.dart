import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/articles/presentation/cubits/get_all_articles/get_all_articles_cubit.dart';
import 'package:zyntra/features/articles/presentation/widgets/articles_grid/articles_grid_bloc_consumer.dart';

import 'articles_pagination.dart';

class ArticlesGrid extends StatefulWidget {
  const ArticlesGrid({super.key, required this.selectedCategories});

  final Set<String> selectedCategories;

  @override
  State<ArticlesGrid> createState() => _ArticlesGridState();
}

class _ArticlesGridState extends State<ArticlesGrid> {
  int _currentPage = 1;
  int crossAxisCount = 3;
  double childAspectRatio = 1.0;

  // ✅ الـ articles بتيجي من الـ Cubit مش من widget
  List<ArticleEntity> get _allArticles =>
      context.read<GetAllArticlesCubit>().articles;

  List<ArticleEntity> get _filteredArticles {
    if (widget.selectedCategories.contains('all')) return _allArticles;
    return _allArticles.where((article) {
      return article.topics.any(
        (topic) => widget.selectedCategories.contains(topic),
      );
    }).toList();
  }

  int get _totalPages {
    return (556 / 10).ceil().clamp(1, 999);
  }

  @override
  void didUpdateWidget(ArticlesGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategories != widget.selectedCategories) {
      setState(() => _currentPage = 1);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.sizeOf(context).width;
    if (width <= SizeConfig.tablet) {
      setState(() {
        crossAxisCount = 1;
        childAspectRatio = 0.75;
      });
    } else if (width <= SizeConfig.desktop) {
      setState(() {
        crossAxisCount = 2;
        childAspectRatio = 0.85;
      });
    } else {
      setState(() {
        crossAxisCount = 3;
        childAspectRatio = 1.0;
      });
    }
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
    context.read<GetAllArticlesCubit>().getAllArticles(page: page);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArticlesGridBlocConsumer(
          selectedCategories: widget.selectedCategories,
          currentPage: _currentPage,
          pageSize: 10,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        ),
        const SizedBox(height: 24),
        ArticlesPagination(
          currentPage: _currentPage,
          totalPages: _totalPages,
          onPageChanged: _onPageChanged,
        ),
      ],
    );
  }
}
