import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';

abstract class ArticleDetailsRemoteDataSource {
  Future<ArticleDataEntity?> getArticleData({required String id});

  Future<ArticleAnalysisEntity?> getArticleAnalysis({required String id});

  Future<String?> getArticleMindMap({required String id});
}
