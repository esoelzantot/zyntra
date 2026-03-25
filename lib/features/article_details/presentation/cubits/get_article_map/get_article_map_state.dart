part of 'get_article_map_cubit.dart';

@immutable
sealed class GetArticleMapState {}

final class GetArticleMapInitial extends GetArticleMapState {}

final class GetArticleMapLoading extends GetArticleMapState {}

final class GetArticleMapSuccess extends GetArticleMapState {
  final String mindMap;
  final String articleId;

  GetArticleMapSuccess({required this.mindMap, required this.articleId});
}

final class GetArticleMapFailure extends GetArticleMapState {
  final String message;

  GetArticleMapFailure({required this.message});
}
