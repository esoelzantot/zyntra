import 'package:zyntra/core/cache/messages_cache_service.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/local/asky_local_data_source.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';

class AskyLocalDataSourceImpl implements AskyLocalDataSource {
  final IMessagesCacheService cacheService;

  AskyLocalDataSourceImpl({required this.cacheService});

  @override
  Future<List<MessageEntity>> getAllMessages() async {
    return cacheService.getMessages() ?? [];
  }
}
