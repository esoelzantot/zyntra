import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/asky_ai/domain/entities/thread_entity.dart';
import 'package:zyntra/features/asky_ai/domain/repos/asky_repo.dart';

class GetAllThreadsUseCase extends UseCase<List<ThreadEntity>, int> {
  final AskyRepo repo;

  GetAllThreadsUseCase({required this.repo});

  @override
  Future<Either<Failure, List<ThreadEntity>>> call([int page = 1]) async {
    // TODO: implement call
    return await repo.getAllThreads(page: page);
  }
}
