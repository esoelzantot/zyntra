import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_data/get_article_data_cubit.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/article_web_hero_section.dart';
import 'package:zyntra/features/article_details/presentation/widgets/hero_section/loadding/article_web_hero_loading.dart';

class ArticleWebHeroBlocConsumer extends StatelessWidget {
  const ArticleWebHeroBlocConsumer({super.key});

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
          return ArticleWebHeroLoading();
        } else if (state is GetArticleDataSuccess) {
          return ArticleWebHeroSection(articleData: state.articleData);
        }
        return Container();
      },
    );
  }
}
