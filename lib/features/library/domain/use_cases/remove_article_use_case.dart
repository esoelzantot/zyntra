import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/library/domain/repos/library_repo.dart';

class RemoveArticleUseCase {
  final LibraryRepo repo;
  RemoveArticleUseCase({required this.repo});

  Future<Either<Failure, Unit>> call({required String articleId}) {
    return repo.removeArticle(articleId: articleId);
  }
}
