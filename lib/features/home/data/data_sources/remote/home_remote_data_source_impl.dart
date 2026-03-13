import 'package:zyntra/core/apis/api_endpoints.dart';
import 'package:zyntra/core/apis/api_services.dart';
import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/data/models/article_model.dart';

import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices api;
  final ArticlesCacheServiceFactory cacheFactory;

  HomeRemoteDataSourceImpl({required this.api, required this.cacheFactory});

  @override
  Future<List<ArticleEntity>> getNewestArticles() async {
    Map<String, dynamic> data = await api.get(
      endPoint: ApiEndpoints.getNewestArticles,
    );
    List<ArticleEntity> articles = _getArticlesList(data);
    final cache = await cacheFactory.getInstance(
      HiveConstants.NEWEST_ARTICLES_BOX,
    );
    cache.cachePage(page: 1, articles: articles);

    return articles;
  }

  List<ArticleEntity> _getArticlesList(Map<String, dynamic> data) {
    List<ArticleEntity> articles = [];
    for (var item in data['articles']) {
      articles.add(ArticleModel.fromJson(item));
    }
    return articles;
  }
}
