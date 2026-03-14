part of 'get_newest_articles_cubit.dart';

@immutable
sealed class GetNewestArticlesState {}

final class GetNewestArticlesInitial extends GetNewestArticlesState {}

final class GetNewestArticlesLoading extends GetNewestArticlesState {}

final class GetNewestArticlesSuccess extends GetNewestArticlesState {
  final List<ArticleEntity> articles;

  GetNewestArticlesSuccess({required this.articles});
}

final class GetNewestArticlesFailure extends GetNewestArticlesState {
  final String message;

  GetNewestArticlesFailure({required this.message});
}
