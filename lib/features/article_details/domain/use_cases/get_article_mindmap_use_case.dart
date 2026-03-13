import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/article_details/domain/repos/article_details_repo.dart';

class GetArticleMindmapUseCase extends UseCase<String, String> {
  final ArticleDetailsRepo repo;

  GetArticleMindmapUseCase({required this.repo});

  @override
  Future<Either<Failure, String>> call([String id = '']) async {
    // TODO: implement call
    return await repo.getArticleMindMap(id: id);
  }
}
