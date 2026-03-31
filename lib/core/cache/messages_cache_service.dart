// messages_cache_service.dart
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';

abstract class IMessagesCacheService {
  Future<void> cacheMessages({required List<MessageEntity> messages});
  Future<void> appendMessage({required MessageEntity message});
  List<MessageEntity>? getMessages();
  Future<void> clearAll();
}

@LazySingleton(as: IMessagesCacheService)
class MessagesCacheService implements IMessagesCacheService {
  static final String _boxName = HiveConstants.ALL_MESSAGES_BOX;
  static const String _messagesKey = 'messages';

  Box get _box => Hive.box(_boxName);

  @override
  Future<void> cacheMessages({required List<MessageEntity> messages}) async {
    await _box.put(_messagesKey, messages);
  }

  @override
  Future<void> appendMessage({required MessageEntity message}) async {
    final existing = getMessages() ?? [];
    await _box.put(_messagesKey, [...existing, message]);
  }

  @override
  List<MessageEntity>? getMessages() {
    final cached = _box.get(_messagesKey);
    if (cached == null) return null;
    return List<MessageEntity>.from(cached);
  }

  @override
  Future<void> clearAll() => _box.clear();
}
