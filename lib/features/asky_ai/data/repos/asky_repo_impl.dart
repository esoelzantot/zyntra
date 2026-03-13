import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/local/asky_local_data_source_impl.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/remote/asky_remote_data_source_impl.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/thread_entity.dart';
import 'package:zyntra/features/asky_ai/domain/repos/asky_repo.dart';

class AskyRepoImpl implements AskyRepo {
  final AskyRemoteDataSourceImpl remote;
  final AskyLocalDataSourceImpl local;

  AskyRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<ThreadEntity>>> getAllThreads({
    required int page,
  }) async {
    // TODO: implement getAllThreads
    try {
      List<ThreadEntity> localThreads = await local.getAllThreads(page: page);
      if (localThreads.isNotEmpty) {
        return right(localThreads);
      } else {
        return right([]);
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendQuery({
    required QueryEntity query,
  }) async {
    // TODO: implement sendQuery
    try {
      MessageEntity? message = await remote.sendQuery(query: query);
      return right(message);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }
}
