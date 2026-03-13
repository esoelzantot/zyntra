import 'package:zyntra/features/asky_ai/domain/entities/thread_entity.dart';

abstract class AskyLocalDataSource {
  Future<List<ThreadEntity>> getAllThreads({required int page});
}
