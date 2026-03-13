import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/articles/data/data_sources/local/articles_local_data_source_impl.dart';
import 'package:zyntra/features/articles/data/data_sources/remote/articles_remote_data_source_impl.dart';
import 'package:zyntra/features/articles/domain/repos/articles_repo.dart';

class ArticlesRepoImpl implements ArticlesRepo {
  final ArticlesRemoteDataSourceImpl remote;
  final ArticlesLocalDataSourceImpl local;

  ArticlesRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<ArticleEntity>>> getAllArticles({
    required int page,
  }) async {
    // TODO: implement getAllArticles
    try {
      List<ArticleEntity> localBooks = await local.getAllArticles(page: page);
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      } else {
        List<ArticleEntity> remoteBooks = await remote.getAllArticles(
          page: page,
        );
        return right(remoteBooks);
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }
}
