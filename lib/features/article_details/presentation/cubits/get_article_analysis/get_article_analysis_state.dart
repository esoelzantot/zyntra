part of 'get_article_analysis_cubit.dart';

@immutable
sealed class GetArticleAnalysisState {}

final class GetArticleAnalysisInitial extends GetArticleAnalysisState {}

final class GetArticleAnalysisLoading extends GetArticleAnalysisState {}

final class GetArticleAnalysisSuccess extends GetArticleAnalysisState {
  final ArticleAnalysisEntity articleAnalysis;

  GetArticleAnalysisSuccess({required this.articleAnalysis});
}

final class GetArticleAnalysisFailure extends GetArticleAnalysisState {
  final String message;

  GetArticleAnalysisFailure({required this.message});
}
