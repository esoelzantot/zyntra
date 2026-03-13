import 'package:zyntra/core/data/entities/article_entity.dart';

abstract class ArticlesLocalDataSource {
  Future<List<ArticleEntity>> getAllArticles({required int page});
}
