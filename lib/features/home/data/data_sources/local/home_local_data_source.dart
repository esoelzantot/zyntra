import 'package:zyntra/core/data/entities/article_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<ArticleEntity>> getNewestArticles();
}
