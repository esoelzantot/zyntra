import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';
import 'package:zyntra/features/asky_ai/domain/repos/asky_repo.dart';

class SendQueryUseCase extends UseCase<MessageEntity, QueryEntity> {
  final AskyRepo repo;

  SendQueryUseCase({required this.repo});

  @override
  Future<Either<Failure, MessageEntity>> call([QueryEntity? query]) async {
    return await repo.sendQuery(query: query!);
  }
}
