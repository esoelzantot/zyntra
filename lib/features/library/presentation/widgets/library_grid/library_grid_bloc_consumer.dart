import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/library/presentation/cubits/get_saved_articles/get_saved_articles_cubit.dart';
import 'package:zyntra/features/library/presentation/widgets/library_grid/library_empty.dart';
import 'package:zyntra/features/library/presentation/widgets/library_grid/library_grid_loading_indicator.dart';

import 'library_grid_view.dart';

class LibraryGridBlocConsumer extends StatelessWidget {
  final Set<String> selectedCategories; // ✅ محتاجينها للـ filtering
  final int currentPage;
  final int pageSize;
  final int crossAxisCount;
  final double childAspectRatio;

  const LibraryGridBlocConsumer({
    super.key,
    required this.selectedCategories,
    required this.currentPage,
    required this.pageSize,
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSavedArticlesCubit, GetSavedArticlesState>(
      listener: (context, state) {
        if (state is GetSavedArticlesFailure) {
          CustomSnackBar.showError(context, state.message);
        }
        if (state is GetSavedArticlesPaginationFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        // Loading للـ page الأولى
        if (state is GetSavedArticlesLoading) {
          return LibraryGridLoadingIndicator(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            pageSize: pageSize,
          );
        }

        // ✅ الـ articles جاهزة من الـ API مباشرة — مفيش slicing هنا
        final articles = context.read<GetSavedArticlesCubit>().articles;

        // Filtering على الـ articles الجاية من الـ server للـ page دي بس
        final filtered = selectedCategories.contains('all')
            ? articles
            : articles
                  .where(
                    (a) => a.topics.any((t) => selectedCategories.contains(t)),
                  )
                  .toList();

        if (state is GetSavedArticlesPaginationLoading) {
          // ✅ بنعرض الـ shimmer على الـ articles القديمة أو فاضية
          return LibraryGridLoadingIndicator(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            pageSize: pageSize,
          );
        }

        if (filtered.isEmpty) {
          return Align(alignment: Alignment.center, child: LibraryEmpty());
        }

        return LibraryGridView(
          articles: filtered, // ✅ مباشرة من الـ API
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        );
      },
    );
  }
}
