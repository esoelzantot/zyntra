import 'package:zyntra/core/apis/api_endpoints.dart';
import 'package:zyntra/core/apis/api_services.dart';
import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/features/article_details/data/data_sources/remote/article_details_remote_data_source.dart';
import 'package:zyntra/features/article_details/data/models/article_analysis_model.dart';
import 'package:zyntra/features/article_details/data/models/article_data_model.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';

class ArticleDetailsRemoteDataSourceImpl
    implements ArticleDetailsRemoteDataSource {
  final ApiServices api;
  final ArticlesCacheServiceFactory cacheFactory;

  ArticleDetailsRemoteDataSourceImpl({
    required this.api,
    required this.cacheFactory,
  });

  @override
  Future<String?> getArticleMindMap({required String id}) async {
    // TODO: implement createArticleMindMap
    Map<String, dynamic> data = await api.get(
      endPoint: ApiEndpoints.getArticleMindMap.replaceAll('{pmc_id}', id),
    );

    String map = data['mindmap'];
    final cache = await cacheFactory.getInstance(
      HiveConstants.ARTICLE_MINDMAP_BOX.replaceAll('{id}', id),
    );
    cache.cacheArticleMap(id: id, map: map);
    return map;
  }

  @override
  Future<ArticleAnalysisEntity?> getArticleAnalysis({
    required String id,
  }) async {
    // TODO: implement getArticleAnalysis
    Map<String, dynamic> data = await api.get(
      endPoint: ApiEndpoints.getArticleAnalysis.replaceAll('{pmc_id}', id),
    );

    ArticleAnalysisEntity articleAnalysis = ArticleAnalysisModel.fromJson(
      id,
      data['research_data'],
    );
    final cache = await cacheFactory.getInstance(
      HiveConstants.ARTICLE_ANALYSIS_BOX.replaceAll('{id}', id),
    );
    cache.cacheArticleAnalysis(id: id, articleAnalysis: articleAnalysis);
    return articleAnalysis;
  }

  @override
  Future<ArticleDataEntity?> getArticleData({required String id}) async {
    // TODO: implement getArticleData
    Map<String, dynamic> data = await api.get(
      endPoint: ApiEndpoints.getArticleData.replaceAll('{pmc_id}', id),
    );

    ArticleDataEntity articleData = ArticleDataModel.fromJson(data['article']);
    final cache = await cacheFactory.getInstance(
      HiveConstants.ARTICLE_DATA_BOX.replaceAll('{id}', id),
    );
    cache.cacheArticleData(id: id, articleDate: articleData);
    return articleData;
  }
}
