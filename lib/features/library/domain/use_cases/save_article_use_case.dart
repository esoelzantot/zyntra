import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/library/domain/repos/library_repo.dart';

class SaveArticleUseCase {
  final LibraryRepo repo;
  SaveArticleUseCase({required this.repo});

  Future<Either<Failure, Unit>> call({required ArticleEntity article}) {
    return repo.saveArticle(article: article);
  }
}
