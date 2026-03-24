part of 'get_all_articles_cubit.dart';

@immutable
sealed class GetAllArticlesState {}

final class GetAllArticlesInitial extends GetAllArticlesState {}

final class GetAllArticlesLoading extends GetAllArticlesState {}

final class GetAllArticlesSuccess extends GetAllArticlesState {
  final List<ArticleEntity> articles;

  GetAllArticlesSuccess({required this.articles});
}

final class GetAllArticlesFailure extends GetAllArticlesState {
  final String message;

  GetAllArticlesFailure({required this.message});
}

// PAGINATION STATES
final class GetAllArticlesPaginationLoading extends GetAllArticlesState {}

final class GetAllArticlesPaginationFailure extends GetAllArticlesState {
  final String message;

  GetAllArticlesPaginationFailure({required this.message});
}
