import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';

abstract class AskyLocalDataSource {
  Future<List<MessageEntity>> getAllMessages();
}
