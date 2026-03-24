part of 'get_saved_articles_cubit.dart';

@immutable
sealed class GetSavedArticlesState {}

final class GetSavedArticlesInitial extends GetSavedArticlesState {}

final class GetSavedArticlesLoading extends GetSavedArticlesState {}

final class GetSavedArticlesSuccess extends GetSavedArticlesState {
  final List<ArticleEntity> articles;

  GetSavedArticlesSuccess({required this.articles});
}

final class GetSavedArticlesFailure extends GetSavedArticlesState {
  final String message;

  GetSavedArticlesFailure({required this.message});
}

// PAGINATION STATES
final class GetSavedArticlesPaginationLoading extends GetSavedArticlesState {}

final class GetSavedArticlesPaginationFailure extends GetSavedArticlesState {
  final String message;

  GetSavedArticlesPaginationFailure({required this.message});
}
