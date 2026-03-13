import 'package:zyntra/core/cache/threads_cache_service_factory.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/local/asky_local_data_source.dart';
import 'package:zyntra/features/asky_ai/domain/entities/thread_entity.dart';

class AskyLocalDataSourceImpl implements AskyLocalDataSource {
  final ThreadsCacheServiceFactory cacheFactory;

  AskyLocalDataSourceImpl({required this.cacheFactory});

  @override
  Future<List<ThreadEntity>> getAllThreads({required int page}) async {
    // TODO: implement getAllThreads
    final cache = await cacheFactory.getInstance(HiveConstants.ALL_THREADS_BOX);
    List<ThreadEntity>? threads = cache.getPage(page: page);
    return threads ?? [];
  }
}
