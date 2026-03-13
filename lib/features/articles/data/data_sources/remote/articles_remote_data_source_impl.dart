import 'package:zyntra/core/apis/api_endpoints.dart';
import 'package:zyntra/core/apis/api_services.dart';
import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/data/models/article_model.dart';
import 'package:zyntra/features/articles/data/data_sources/remote/articles_remote_data_source.dart';

class ArticlesRemoteDataSourceImpl implements ArticlesRemoteDataSource {
  final ApiServices api;
  final ArticlesCacheServiceFactory cacheFactory;

  ArticlesRemoteDataSourceImpl({required this.api, required this.cacheFactory});

  @override
  Future<List<ArticleEntity>> getAllArticles({required int page}) async {
    // TODO: implement getAllArticles
    Map<String, dynamic> data = await api.get(
      endPoint: ApiEndpoints.getAllArticles,
      query: {"page": page},
    );

    List<ArticleEntity> articles = _getArticlesList(data);
    final cache = await cacheFactory.getInstance(
      HiveConstants.ALL_ARTICLES_BOX,
    );
    cache.cachePage(page: page, articles: articles);
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
