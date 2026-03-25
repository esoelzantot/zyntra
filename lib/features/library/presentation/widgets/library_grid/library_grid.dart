import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/features/library/presentation/cubits/get_saved_articles/get_saved_articles_cubit.dart';
import 'package:zyntra/features/library/presentation/widgets/library_grid/library_grid_bloc_consumer.dart';

import 'library_pagination.dart';

class LibraryGrid extends StatefulWidget {
  const LibraryGrid({super.key, required this.selectedCategories});

  final Set<String> selectedCategories;

  @override
  State<LibraryGrid> createState() => _LibraryGridState();
}

class _LibraryGridState extends State<LibraryGrid> {
  int _currentPage = 1;
  int crossAxisCount = 3;
  double childAspectRatio = 1.0;

  int get _totalPages {
    return (556 / 10).ceil().clamp(1, 999);
  }

  @override
  void didUpdateWidget(LibraryGrid oldWidget) {
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
    context.read<GetSavedArticlesCubit>().getSavedArticles(page: page);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LibraryGridBlocConsumer(
          selectedCategories: widget.selectedCategories,
          currentPage: _currentPage,
          pageSize: 10,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        ),
        const SizedBox(height: 24),
        LibraryPagination(
          currentPage: _currentPage,
          totalPages: _totalPages,
          onPageChanged: _onPageChanged,
        ),
      ],
    );
  }
}
