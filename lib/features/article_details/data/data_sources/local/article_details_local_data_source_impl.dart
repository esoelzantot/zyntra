import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/features/article_details/data/data_sources/local/article_details_local_data_source.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';

class ArticleDetailsLocalDataSourceImpl
    implements ArticleDetailsLocalDataSource {
  final ArticlesCacheServiceFactory cacheFactory;

  ArticleDetailsLocalDataSourceImpl({required this.cacheFactory});

  @override
  Future<String?> getArticleMindMap({required String id}) async {
    // TODO: implement createArticleMindMap
    final cache = await cacheFactory.getInstance(
      HiveConstants.ARTICLE_MINDMAP_BOX.replaceAll('{id}', id),
    );
    String? map = cache.getArticleMap(id: id);
    return map;
  }

  @override
  Future<ArticleAnalysisEntity?> getArticleAnalysis({
    required String id,
  }) async {
    // TODO: implement getArticleAnalysis
    final cache = await cacheFactory.getInstance(
      HiveConstants.ARTICLE_ANALYSIS_BOX.replaceAll('{id}', id),
    );
    ArticleAnalysisEntity? articleAnalysis = cache.getArticleAnalysis(id: id);
    return articleAnalysis;
  }

  @override
  Future<ArticleDataEntity?> getArticleData({required String id}) async {
    // TODO: implement getArticleData
    final cache = await cacheFactory.getInstance(
      HiveConstants.ARTICLE_DATA_BOX.replaceAll('{id}', id),
    );
    ArticleDataEntity? articleData = cache.getArticleData(id: id);
    return articleData;
  }
}
