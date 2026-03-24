import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/articles/presentation/cubits/get_all_articles/get_all_articles_cubit.dart';
import 'package:zyntra/features/articles/presentation/widgets/articles_grid/articles_empty.dart';
import 'package:zyntra/features/articles/presentation/widgets/articles_grid/articles_grid_loading_indicator.dart';

import 'articles_grid_view.dart';

class ArticlesGridBlocConsumer extends StatelessWidget {
  final Set<String> selectedCategories; // ✅ محتاجينها للـ filtering
  final int currentPage;
  final int pageSize;
  final int crossAxisCount;
  final double childAspectRatio;

  const ArticlesGridBlocConsumer({
    super.key,
    required this.selectedCategories,
    required this.currentPage,
    required this.pageSize,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllArticlesCubit, GetAllArticlesState>(
      listener: (context, state) {
        if (state is GetAllArticlesFailure) {
          CustomSnackBar.showError(context, state.message);
        }
        if (state is GetAllArticlesPaginationFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        // Loading للـ page الأولى
        if (state is GetAllArticlesLoading) {
          return ArticlesGridLoadingIndicator(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            pageSize: pageSize,
          );
        }

        // ✅ الـ articles جاهزة من الـ API مباشرة — مفيش slicing هنا
        final articles = context.read<GetAllArticlesCubit>().articles;

        // Filtering على الـ articles الجاية من الـ server للـ page دي بس
        final filtered = selectedCategories.contains('all')
            ? articles
            : articles
                  .where(
                    (a) => a.topics.any((t) => selectedCategories.contains(t)),
                  )
                  .toList();

        if (state is GetAllArticlesPaginationLoading) {
          // ✅ بنعرض الـ shimmer على الـ articles القديمة أو فاضية
          return ArticlesGridLoadingIndicator(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            pageSize: pageSize,
          );
        }

        if (filtered.isEmpty) {
          return Align(alignment: Alignment.center, child: ArticlesEmpty());
        }

        return ArticlesGridView(
          articles: filtered, // ✅ مباشرة من الـ API
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        );
      },
    );
  }
}
