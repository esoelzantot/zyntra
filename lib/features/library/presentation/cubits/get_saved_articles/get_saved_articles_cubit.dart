import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/library/domain/use_cases/get_saved_articles_use_case.dart';

part 'get_saved_articles_state.dart';

class GetSavedArticlesCubit extends Cubit<GetSavedArticlesState> {
  final GetSavedArticlesUseCase useCase;

  List<ArticleEntity> articles = [];

  GetSavedArticlesCubit({required this.useCase})
    : super(GetSavedArticlesInitial());

  Future<void> getSavedArticles({required int page}) async {
    // Page 1 = initial full loading, غيره = pagination loading
    page == 1
        ? emit(GetSavedArticlesLoading())
        : emit(GetSavedArticlesPaginationLoading());

    final result = await useCase.call(page);

    result.fold(
      (failure) {
        page == 1
            ? emit(GetSavedArticlesFailure(message: failure.message))
            : emit(GetSavedArticlesPaginationFailure(message: failure.message));
      },
      (data) {
        articles = data;
        emit(GetSavedArticlesSuccess(articles: data));
      },
    );
  }
}
