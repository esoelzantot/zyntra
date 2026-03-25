import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_map/get_article_map_cubit.dart';
import 'package:zyntra/features/article_details/presentation/widgets/main_content/article_mind_map.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/mind_map_loading_indicator.dart';

import 'mind_map_initial_state.dart';

class MindMapBlocConsumer extends StatelessWidget {
  final String articleId;
  const MindMapBlocConsumer({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetArticleMapCubit, GetArticleMapState>(
      listener: (context, state) {
        if (state is GetArticleMapFailure) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is GetArticleMapLoading) {
          return MindMapLoadingIndicator();
        } else if (state is GetArticleMapSuccess &&
            state.articleId == articleId) {
          return InteractiveResearchMap(markmapText: state.mindMap);
        }
        return MindMapInitialState(
          onGenerate: () {
            context.read<GetArticleMapCubit>().getArticleMindMap(id: articleId);
          },
        );
      },
      buildWhen: (previous, current) {
        return current is! GetArticleMapLoading ||
            current is! GetArticleMapFailure ||
            current is! GetArticleMapSuccess;
      },
    );
  }
}
