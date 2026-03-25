import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_data/get_article_data_cubit.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_main_content.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/loading/article_main_content_loading.dart';

class ArticleMainContentBlocConsumer extends StatelessWidget {
  const ArticleMainContentBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetArticleDataCubit, GetArticleDataState>(
      listener: (context, state) {
        if (state is GetArticleDataFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        // Loading للـ page الأولى
        if (state is GetArticleDataLoading) {
          return ArticleMainContentLoading();
        } else if (state is GetArticleDataSuccess) {
          return ArticleMainContent(articleData: state.articleData);
        }
        return Container();
      },
    );
  }
}
