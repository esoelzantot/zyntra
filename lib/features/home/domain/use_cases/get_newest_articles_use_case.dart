import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/home/domain/repos/home_repo.dart';

class GetNewestArticlesUseCase extends UseCase<List<ArticleEntity>, int> {
  final HomeRepo repo;

  GetNewestArticlesUseCase({required this.repo});

  @override
  Future<Either<Failure, List<ArticleEntity>>> call([int page = 1]) async {
    // TODO: implement call
    return await repo.getNewestArticles();
  }
}
