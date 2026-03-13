import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:zyntra/features/asky_ai/domain/entities/thread_entity.dart';

abstract class IThreadsCacheService {
  void cachePage({required int page, required List<ThreadEntity> threads});

  void cacheThreadData({required String id, required ThreadEntity thread});

  List<ThreadEntity>? getPage({required int page});

  ThreadEntity? getThreadData({required String id});

  Future<void> clearAll();
}

@LazySingleton(as: IThreadsCacheService)
class ThreadsCacheService implements IThreadsCacheService {
  final String boxName;

  ThreadsCacheService({required this.boxName});

  // كل page ليها key خاص بيها
  String _pageKey(int page) => 'threads_page_$page';

  String _threadDataKey(String id) => 'thread_data_$id';

  Box get _box => Hive.box(boxName);

  @override
  void cachePage({required int page, required List<ThreadEntity> threads}) {
    _box.put(_pageKey(page), threads);
  }

  @override
  void cacheThreadData({required String id, required ThreadEntity thread}) {
    _box.put(_threadDataKey(id), thread);
  }

  @override
  List<ThreadEntity>? getPage({required int page}) {
    final cached = _box.get(_pageKey(page));
    if (cached == null) return null;
    return List<ThreadEntity>.from(cached);
  }

  @override
  ThreadEntity? getThreadData({required String id}) {
    final cached = _box.get(_threadDataKey(id));
    if (cached == null) return null;
    return cached;
  }

  @override
  Future<void> clearAll() => _box.clear();
}
