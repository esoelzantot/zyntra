import 'package:zyntra/core/data/entities/article_entity.dart';

abstract class LibraryLocalDataSource {
  Future<List<ArticleEntity>> getSavedArticles({required int page});
}
