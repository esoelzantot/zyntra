import 'package:hive/hive.dart';
import 'package:zyntra/core/cache/articles_cache_service.dart';
import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/library/data/data_sources/local/library_local_data_source.dart';

class LibraryLocalDataSourceImpl implements LibraryLocalDataSource {
  final ArticlesCacheServiceFactory cacheFactory;

  LibraryLocalDataSourceImpl({required this.cacheFactory});

  static const int _pageSize = 9;

  @override
  Future<void> saveArticle({required ArticleEntity article}) async {
    final cache = await cacheFactory.getInstance(
      HiveConstants.SAVED_ARTICLES_BOX,
    );
    await cache.saveArticle(article: article);
  }

  @override
  Future<void> removeArticle({required String articleId}) async {
    final cache = await cacheFactory.getInstance(
      HiveConstants.SAVED_ARTICLES_BOX,
    );
    await cache.removeArticle(articleId: articleId);
  }

  @override
  bool isArticleSaved({required String articleId}) {
    // ✅ sync لأنه local فقط
    final box = Hive.box(HiveConstants.SAVED_ARTICLES_BOX);
    final ArticlesCacheService cache = ArticlesCacheService(
      boxName: HiveConstants.SAVED_ARTICLES_BOX,
    );
    return cache.isArticleSaved(articleId: articleId);
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles({required int page}) async {
    final cache = await cacheFactory.getInstance(
      HiveConstants.SAVED_ARTICLES_BOX,
    );
    final all = cache.getAllSavedArticles();

    // ✅ Client-side pagination — لأن الـ data كلها local
    final start = (page - 1) * _pageSize;
    if (start >= all.length) return [];
    final end = (start + _pageSize).clamp(0, all.length);
    return all.sublist(start, end);
  }
}
