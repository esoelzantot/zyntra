import 'package:zyntra/core/data/entities/article_entity.dart';

abstract class LibraryLocalDataSource {
  Future<List<ArticleEntity>> getSavedArticles({required int page});

  // ✅ جديد
  Future<void> saveArticle({required ArticleEntity article});
  Future<void> removeArticle({required String articleId});
  bool isArticleSaved({required String articleId});
}
