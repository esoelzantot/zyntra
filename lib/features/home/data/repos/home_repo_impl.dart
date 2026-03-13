import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/home/data/data_sources/local/home_local_data_source_impl.dart';
import 'package:zyntra/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:zyntra/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSourceImpl remote;
  final HomeLocalDataSourceImpl local;

  HomeRepoImpl({required this.remote, required this.local});
  @override
  Future<Either<Failure, List<ArticleEntity>>> getNewestArticles() async {
    // TODO: implement getNewestArticles
    try {
      List<ArticleEntity> localBooks = await local.getNewestArticles();
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      } else {
        List<ArticleEntity> remoteBooks = await remote.getNewestArticles();
        return right(remoteBooks);
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }
}
