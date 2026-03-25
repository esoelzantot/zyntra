import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_data_use_case.dart';

part 'get_article_data_state.dart';

class GetArticleDataCubit extends Cubit<GetArticleDataState> {
  final GetArticleDataUseCase useCase;

  late ArticleDataEntity article;

  GetArticleDataCubit({required this.useCase}) : super(GetArticleDataInitial());

  Future<void> getArticleData({required String id}) async {
    emit(GetArticleDataLoading());

    final result = await useCase.call(id);

    result.fold(
      (failure) => emit(GetArticleDataFailure(message: failure.message)),
      (articleData) {
        article = articleData;
        emit(GetArticleDataSuccess(articleData: article));
      },
    );
  }
}
