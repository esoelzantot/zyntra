import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/article_details/data/data_sources/local/article_details_local_data_source_impl.dart';
import 'package:zyntra/features/article_details/data/data_sources/remote/article_details_remote_data_source_impl.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';
import 'package:zyntra/features/article_details/domain/repos/article_details_repo.dart';

class ArticleDetailsRepoImpl implements ArticleDetailsRepo {
  final ArticleDetailsRemoteDataSourceImpl remote;
  final ArticleDetailsLocalDataSourceImpl local;

  ArticleDetailsRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, String>> getArticleMindMap({
    required String id,
  }) async {
    // TODO: implement createArticleMindMap
    try {
      String? localMap = await local.getArticleMindMap(id: id);
      if (localMap != null) {
        return right(localMap);
      } else {
        String? remoteMap = await remote.getArticleMindMap(id: id);
        return right(remoteMap!);
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }

  @override
  Future<Either<Failure, ArticleAnalysisEntity>> getArticleAnalysis({
    required String id,
  }) async {
    // TODO: implement getArticleAnalysis
    try {
      ArticleAnalysisEntity? localAnalysis = await local.getArticleAnalysis(
        id: id,
      );
      if (localAnalysis != null) {
        return right(localAnalysis);
      } else {
        ArticleAnalysisEntity? remoteAnalysis = await remote.getArticleAnalysis(
          id: id,
        );
        return right(remoteAnalysis!);
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }

  @override
  Future<Either<Failure, ArticleDataEntity>> getArticleData({
    required String id,
  }) async {
    // TODO: implement getArticleData
    try {
      ArticleDataEntity? localData = await local.getArticleData(id: id);
      if (localData != null) {
        return right(localData);
      } else {
        ArticleDataEntity? remoteData = await remote.getArticleData(id: id);
        return right(remoteData!);
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }
}
