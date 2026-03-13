// threads_cache_service_factory.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zyntra/core/cache/threads_cache_service.dart';

class ThreadsCacheServiceFactory {
  final Map<String, ThreadsCacheService> _instances = {};

  Future<ThreadsCacheService> getInstance(String boxName) async {
    if (!_instances.containsKey(boxName)) {
      // افتح الـ box لو مش مفتوح
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox(boxName);
      }
      _instances[boxName] = ThreadsCacheService(boxName: boxName);
    }
    return _instances[boxName]!;
  }
}
