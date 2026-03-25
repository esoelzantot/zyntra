import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/home/presentation/cubits/newest_articles/get_newest_articles_cubit.dart';
import 'package:zyntra/features/home/presentation/widgets/newest_articles_list/newest_articles_list_view.dart';
import 'package:zyntra/features/home/presentation/widgets/newest_articles_list/newest_articles_loading_indicator.dart';

class NewestArticlesListViewBlocConsumer extends StatelessWidget {
  const NewestArticlesListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetNewestArticlesCubit, GetNewestArticlesState>(
      listener: (context, state) {
        if (state is GetNewestArticlesFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is GetNewestArticlesSuccess) {
          return NewestArticlesListView(articles: state.articles);
        } else if (state is GetNewestArticlesFailure) {
          return NewestArticlesListView(
            articles: context.read<GetNewestArticlesCubit>().articles,
          );
        } else {
          return const NewestArticlesLoadingIndicator();
        }
      },
    );
  }
}
