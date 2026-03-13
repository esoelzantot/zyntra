import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ArticleEntity>>> getNewestArticles();
}
