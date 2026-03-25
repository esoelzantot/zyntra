import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/articles/domain/use_cases/get_all_articles_use_case.dart';

part 'get_all_articles_state.dart';

class GetAllArticlesCubit extends Cubit<GetAllArticlesState> {
  final GetAllArticlesUseCase useCase;

  List<ArticleEntity> articles = [];

  GetAllArticlesCubit({required this.useCase}) : super(GetAllArticlesInitial());

  Future<void> getAllArticles({required int page}) async {
    // Page 1 = initial full loading, غيره = pagination loading
    page == 1
        ? emit(GetAllArticlesLoading())
        : emit(GetAllArticlesPaginationLoading());

    final result = await useCase.call(page);

    result.fold(
      (failure) {
        page == 1
            ? emit(GetAllArticlesFailure(message: failure.message))
            : emit(GetAllArticlesPaginationFailure(message: failure.message));
      },
      (data) {
        // ✅ كل page بتيجي من الـ API مباشرة، مش بنعمل append أو slice
        articles = data;
        emit(GetAllArticlesSuccess(articles: data));
      },
    );
  }
}
