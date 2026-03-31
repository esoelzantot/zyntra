import 'package:zyntra/core/apis/api_endpoints.dart';
import 'package:zyntra/core/apis/api_services.dart';
import 'package:zyntra/core/cache/messages_cache_service.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/remote/asky_remote_data_source.dart';
import 'package:zyntra/features/asky_ai/data/models/message_model.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';

class AskyRemoteDataSourceImpl implements AskyRemoteDataSource {
  final ApiServices api;
  final IMessagesCacheService cacheService;

  AskyRemoteDataSourceImpl({required this.api, required this.cacheService});

  @override
  Future<MessageEntity> sendQuery({required QueryEntity query}) async {
    // 1. Call API
    final Map<String, dynamic> data = await api.post(
      endPoint: ApiEndpoints.askAI,
      data: {"query": query.message, "top_k": 3},
    );

    // 2. Parse response → MessageEntity
    final MessageEntity message = MessageModel.fromJson(data).toEntity();

    // 3. Append message to cache
    await cacheService.appendMessage(message: message);

    return message;
  }
}
