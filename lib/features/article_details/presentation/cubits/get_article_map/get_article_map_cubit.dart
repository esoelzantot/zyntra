import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_mindmap_use_case.dart';

part 'get_article_map_state.dart';

class GetArticleMapCubit extends Cubit<GetArticleMapState> {
  final GetArticleMindmapUseCase useCase;

  GetArticleMapCubit({required this.useCase}) : super(GetArticleMapInitial());

  Future<void> getArticleMindMap({required String id}) async {
    emit(GetArticleMapLoading());

    final result = await useCase.call(id);

    result.fold(
      (failure) => emit(GetArticleMapFailure(message: failure.message)),
      (map) {
        emit(GetArticleMapSuccess(mindMap: map, articleId: id));
      },
    );
  }
}
