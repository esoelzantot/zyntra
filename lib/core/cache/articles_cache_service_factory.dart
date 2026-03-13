// articles_cache_service_factory.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zyntra/core/cache/articles_cache_service.dart';

class ArticlesCacheServiceFactory {
  final Map<String, ArticlesCacheService> _instances = {};

  Future<ArticlesCacheService> getInstance(String boxName) async {
    if (!_instances.containsKey(boxName)) {
      // افتح الـ box لو مش مفتوح
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox(boxName);
      }
      _instances[boxName] = ArticlesCacheService(boxName: boxName);
    }
    return _instances[boxName]!;
  }
}
