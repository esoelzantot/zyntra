import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';

abstract class AskyRemoteDataSource {
  Future<MessageEntity> sendQuery({required QueryEntity query});
}
