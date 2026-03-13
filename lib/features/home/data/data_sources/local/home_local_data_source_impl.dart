import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';

import 'home_local_data_source.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final ArticlesCacheServiceFactory cacheFactory;

  HomeLocalDataSourceImpl({required this.cacheFactory});

  @override
  Future<List<ArticleEntity>> getNewestArticles() async {
    final cache = await cacheFactory.getInstance(
      HiveConstants.NEWEST_ARTICLES_BOX,
    );
    List<ArticleEntity>? articles = cache.getPage(page: 1);

    return articles ?? [];
  }
}
