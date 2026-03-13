import 'package:hive/hive.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';

void cacheArticlesData({
  required List<ArticleEntity> articles,
  required String boxName,
}) {
  Box<ArticleEntity> box = Hive.box<ArticleEntity>(boxName);
  box.addAll(articles);
}
