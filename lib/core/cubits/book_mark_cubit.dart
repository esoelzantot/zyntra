import 'package:bloc/bloc.dart';
import 'package:zyntra/core/cubits/book_mark_state.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/library/domain/repos/library_repo.dart';
import 'package:zyntra/features/library/domain/use_cases/remove_article_use_case.dart';
import 'package:zyntra/features/library/domain/use_cases/save_article_use_case.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final SaveArticleUseCase saveArticleUseCase;
  final RemoveArticleUseCase removeArticleUseCase;
  final LibraryRepo repo;

  BookmarkCubit({
    required this.saveArticleUseCase,
    required this.removeArticleUseCase,
    required this.repo,
  }) : super(const BookmarkState(savedIds: {}));

  // ✅ يتحمل الـ saved IDs من Hive عند الـ init
  void loadSavedIds(List<ArticleEntity> articles) {
    final ids = articles
        .where((a) => repo.isArticleSaved(articleId: a.id))
        .map((a) => a.id)
        .toSet();
    emit(BookmarkState(savedIds: ids));
  }

  bool isBookmarked(String articleId) => state.savedIds.contains(articleId);

  Future<void> toggleBookmark({required ArticleEntity article}) async {
    final isCurrentlySaved = isBookmarked(article.id);

    // ✅ Optimistic update — الـ UI يتغير فوراً
    final updatedIds = Set<String>.from(state.savedIds);
    if (isCurrentlySaved) {
      updatedIds.remove(article.id);
    } else {
      updatedIds.add(article.id);
    }
    emit(BookmarkState(savedIds: updatedIds));

    // ✅ Persist في الـ background
    if (isCurrentlySaved) {
      await removeArticleUseCase.call(articleId: article.id);
    } else {
      await saveArticleUseCase.call(article: article);
    }
  }
}
