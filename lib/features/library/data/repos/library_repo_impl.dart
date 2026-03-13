import 'package:dartz/dartz.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/library/data/data_sources/local/library_local_data_source_impl.dart';
import 'package:zyntra/features/library/domain/repos/library_repo.dart';

class LibraryRepoImpl implements LibraryRepo {
  final LibraryLocalDataSourceImpl local;

  LibraryRepoImpl({required this.local});

  @override
  Future<Either<Failure, List<ArticleEntity>>> getSavedArticles({
    required int page,
  }) async {
    // TODO: implement getSavedArticles
    try {
      List<ArticleEntity> localBooks = await local.getSavedArticles(page: page);
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      } else {
        return right([]);
      }
    } catch (e) {
      return left(ServerFailure(e.toString(), 400));
    }
  }
}
