import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';

abstract class AskyRepo {
  Future<Either<Failure, List<MessageEntity>>> getAllMessages();
  Future<Either<Failure, MessageEntity>> sendQuery({
    required QueryEntity query,
  });
}
