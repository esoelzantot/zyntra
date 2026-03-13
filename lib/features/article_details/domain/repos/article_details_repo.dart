import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';

abstract class ArticleDetailsRepo {
  Future<Either<Failure, ArticleDataEntity>> getArticleData({
    required String id,
  });

  Future<Either<Failure, ArticleAnalysisEntity>> getArticleAnalysis({
    required String id,
  });

  Future<Either<Failure, String>> getArticleMindMap({required String id});
}
