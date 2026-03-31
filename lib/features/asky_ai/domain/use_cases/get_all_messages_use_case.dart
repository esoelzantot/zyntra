import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/repos/asky_repo.dart';

class GetAllMessagesUseCase extends UseCase<List<MessageEntity>, void> {
  final AskyRepo repo;

  GetAllMessagesUseCase({required this.repo});

  @override
  Future<Either<Failure, List<MessageEntity>>> call([void params]) async {
    // TODO: implement call
    return await repo.getAllMessages();
  }
}
