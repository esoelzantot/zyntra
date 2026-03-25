import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';

abstract class IArticlesCacheService {
  void cachePage({required int page, required List<ArticleEntity> articles});

  void cacheArticleData({
    required String id,
    required ArticleDataEntity articleDate,
  });

  void cacheArticleAnalysis({
    required String id,
    required ArticleAnalysisEntity articleAnalysis,
  });

  void cacheArticleMap({required String id, required String map});

  List<ArticleEntity>? getPage({required int page});

  ArticleDataEntity? getArticleData({required String id});

  ArticleAnalysisEntity? getArticleAnalysis({required String id});

  String? getArticleMap({required String id});

  // ✅ جديد — للـ Library
  Future<void> saveArticle({required ArticleEntity article});
  Future<void> removeArticle({required String articleId});
  List<ArticleEntity> getAllSavedArticles();
  bool isArticleSaved({required String articleId});

  Future<void> clearAll();
}

@LazySingleton(as: IArticlesCacheService)
class ArticlesCacheService implements IArticlesCacheService {
  final String boxName;

  ArticlesCacheService({required this.boxName});

  // كل page ليها key خاص بيها
  String _pageKey(int page) => 'articles_page_$page';

  String _articleDataKey(String id) => 'article_data_$id';

  String _articleAnalysisKey(String id) => 'article_analysis_$id';

  String _articleMapKey(String id) => 'article_map_$id';

  static const String _savedKey = 'saved_articles';

  Box get _box => Hive.box(boxName);

  @override
  void cachePage({required int page, required List<ArticleEntity> articles}) {
    _box.put(_pageKey(page), articles);
  }

  @override
  void cacheArticleData({
    required String id,
    required ArticleDataEntity articleDate,
  }) {
    _box.put(_articleDataKey(id), articleDate);
  }

  @override
  void cacheArticleAnalysis({
    required String id,
    required ArticleAnalysisEntity articleAnalysis,
  }) {
    _box.put(_articleAnalysisKey(id), articleAnalysis);
  }

  @override
  void cacheArticleMap({required String id, required String map}) {
    // TODO: implement cacheArticleMap
    _box.put(_articleAnalysisKey(id), map);
  }

  @override
  List<ArticleEntity>? getPage({required int page}) {
    final cached = _box.get(_pageKey(page));
    if (cached == null) return null;
    return List<ArticleEntity>.from(cached);
  }

  @override
  ArticleDataEntity? getArticleData({required String id}) {
    final cached = _box.get(_articleDataKey(id));
    if (cached == null) return null;
    return cached;
  }

  @override
  ArticleAnalysisEntity? getArticleAnalysis({required String id}) {
    final cached = _box.get(_articleAnalysisKey(id));
    if (cached == null) return null;
    return cached;
  }

  @override
  String? getArticleMap({required String id}) {
    // TODO: implement getArticleMap
    final cached = _box.get(_articleMapKey(id));
    if (cached == null) return null;
    return cached;
  }

  @override
  Future<void> saveArticle({required ArticleEntity article}) async {
    final saved = getAllSavedArticles();
    // ✅ متضيفش لو موجودة أصلاً
    final exists = saved.any((a) => a.id == article.id);
    if (!exists) {
      saved.add(article);
      await _box.put(_savedKey, saved);
    }
  }

  @override
  Future<void> removeArticle({required String articleId}) async {
    final saved = getAllSavedArticles();
    saved.removeWhere((a) => a.id == articleId);
    await _box.put(_savedKey, saved);
  }

  @override
  List<ArticleEntity> getAllSavedArticles() {
    final cached = _box.get(_savedKey);
    if (cached == null) return [];
    return List<ArticleEntity>.from(cached);
  }

  @override
  bool isArticleSaved({required String articleId}) {
    return getAllSavedArticles().any((a) => a.id == articleId);
  }

  @override
  Future<void> clearAll() => _box.clear();
}
