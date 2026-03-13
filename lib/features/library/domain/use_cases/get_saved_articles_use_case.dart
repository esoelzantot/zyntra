import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/library/domain/repos/library_repo.dart';

class GetSavedArticlesUseCase extends UseCase<List<ArticleEntity>, int> {
  final LibraryRepo repo;

  GetSavedArticlesUseCase({required this.repo});

  @override
  Future<Either<Failure, List<ArticleEntity>>> call([int page = 1]) async {
    // TODO: implement call
    return await repo.getSavedArticles(page: page);
  }
}
