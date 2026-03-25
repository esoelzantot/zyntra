import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_analysis/get_article_analysis_cubit.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/article_side_content.dart';
import 'package:zyntra/features/article_details/presentation/widgets/side_content/loading/article_side_content_loading.dart';

class ArticleSideContentBlocConsumer extends StatelessWidget {
  const ArticleSideContentBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetArticleAnalysisCubit, GetArticleAnalysisState>(
      listener: (context, state) {
        if (state is GetArticleAnalysisFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        // Loading للـ page الأولى
        if (state is GetArticleAnalysisLoading) {
          return ArticleSideContentLoading();
        } else if (state is GetArticleAnalysisSuccess) {
          return ArticleSideContent(analysis: state.articleAnalysis);
        }
        return Container();
      },
    );
  }
}
