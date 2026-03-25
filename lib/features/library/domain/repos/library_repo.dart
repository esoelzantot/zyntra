import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';

abstract class LibraryRepo {
  Future<Either<Failure, List<ArticleEntity>>> getSavedArticles({
    required int page,
  });

  // ✅ جديد
  Future<Either<Failure, Unit>> saveArticle({required ArticleEntity article});
  Future<Either<Failure, Unit>> removeArticle({required String articleId});
  bool isArticleSaved({required String articleId});
}
