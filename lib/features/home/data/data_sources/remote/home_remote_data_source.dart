import 'package:zyntra/core/data/entities/article_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ArticleEntity>> getNewestArticles();
}
