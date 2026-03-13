import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/articles/data/data_sources/local/articles_local_data_source.dart';

class ArticlesLocalDataSourceImpl implements ArticlesLocalDataSource {
  final ArticlesCacheServiceFactory cacheFactory;

  ArticlesLocalDataSourceImpl({required this.cacheFactory});

  @override
  Future<List<ArticleEntity>> getAllArticles({required int page}) async {
    // TODO: implement getAllArticles
    final cache = await cacheFactory.getInstance(
      HiveConstants.ALL_ARTICLES_BOX,
    );
    List<ArticleEntity>? articles = cache.getPage(page: page);
    return articles ?? [];
  }
}
