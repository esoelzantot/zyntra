import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/library/data/data_sources/local/library_local_data_source.dart';

class LibraryLocalDataSourceImpl implements LibraryLocalDataSource {
  final ArticlesCacheServiceFactory cacheFactory;

  LibraryLocalDataSourceImpl({required this.cacheFactory});

  @override
  Future<List<ArticleEntity>> getSavedArticles({required int page}) async {
    // TODO: implement getSavedArticles
    final cache = await cacheFactory.getInstance(
      HiveConstants.SAVED_ARTICLES_BOX,
    );
    List<ArticleEntity>? articles = cache.getPage(page: page);
    return articles ?? [];
  }
}
