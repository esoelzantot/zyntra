part of 'get_article_data_cubit.dart';

@immutable
sealed class GetArticleDataState {}

final class GetArticleDataInitial extends GetArticleDataState {}

final class GetArticleDataLoading extends GetArticleDataState {}

final class GetArticleDataSuccess extends GetArticleDataState {
  final ArticleDataEntity articleData;

  GetArticleDataSuccess({required this.articleData});
}

final class GetArticleDataFailure extends GetArticleDataState {
  final String message;

  GetArticleDataFailure({required this.message});
}
