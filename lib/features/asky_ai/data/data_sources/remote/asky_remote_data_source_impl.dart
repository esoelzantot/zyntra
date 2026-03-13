import 'package:zyntra/core/apis/api_endpoints.dart';
import 'package:zyntra/core/apis/api_services.dart';
import 'package:zyntra/core/cache/threads_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/remote/asky_remote_data_source.dart';
import 'package:zyntra/features/asky_ai/data/models/message_model.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/thread_entity.dart';

class AskyRemoteDataSourceImpl implements AskyRemoteDataSource {
  final ApiServices api;
  final ThreadsCacheServiceFactory cacheFactory;

  AskyRemoteDataSourceImpl({required this.api, required this.cacheFactory});

  @override
  @override
  Future<MessageEntity> sendQuery({required QueryEntity query}) async {
    // 1. Call API
    final Map<String, dynamic> data = await api.post(
      endPoint: ApiEndpoints.askAI,
      data: {"query": query.query, "top_k": 3},
    );

    // 2. Parse response → MessageEntity
    final MessageEntity message = MessageModel.fromJson(data);

    // 3. Get cache instance
    final cache = await cacheFactory.getInstance(HiveConstants.ALL_THREADS_BOX);

    // 4. Get the page that contains this thread
    final List<ThreadEntity>? cachedThreads = cache.getPage(
      page: query.threadPage,
    );

    if (cachedThreads != null) {
      final int threadIndex = cachedThreads.indexWhere(
        (t) => t.id == query.threadId,
      );

      if (threadIndex != -1) {
        // 5. Update thread with new message
        cachedThreads[threadIndex] = cachedThreads[threadIndex].copyWith(
          messages: [...cachedThreads[threadIndex].messages, message],
        );

        // 6. Re-cache the updated page
        cache.cachePage(page: query.threadPage, threads: cachedThreads);
      }
    }

    return message;
  }
}
