import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';

abstract class ArticlesRepo {
  Future<Either<Failure, List<ArticleEntity>>> getAllArticles({
    required int page,
  });
}
