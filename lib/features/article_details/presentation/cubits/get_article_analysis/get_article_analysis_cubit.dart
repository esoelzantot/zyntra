import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_analysis_use_case.dart';

part 'get_article_analysis_state.dart';

class GetArticleAnalysisCubit extends Cubit<GetArticleAnalysisState> {
  final GetArticleAnalysisUseCase useCase;

  late ArticleAnalysisEntity articleAnalysis;

  GetArticleAnalysisCubit({required this.useCase})
    : super(GetArticleAnalysisInitial());

  Future<void> getArticleAnalysis({required String id}) async {
    emit(GetArticleAnalysisLoading());

    final result = await useCase.call(id);

    result.fold(
      (failure) => emit(GetArticleAnalysisFailure(message: failure.message)),
      (analysis) {
        articleAnalysis = analysis;
        emit(GetArticleAnalysisSuccess(articleAnalysis: articleAnalysis));
      },
    );
  }
}
