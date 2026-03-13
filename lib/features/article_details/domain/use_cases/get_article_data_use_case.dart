import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';
import 'package:zyntra/features/article_details/domain/repos/article_details_repo.dart';

class GetArticleDataUseCase extends UseCase<ArticleDataEntity, String> {
  final ArticleDetailsRepo repo;

  GetArticleDataUseCase({required this.repo});

  @override
  Future<Either<Failure, ArticleDataEntity>> call([String id = '']) async {
    // TODO: implement call
    return await repo.getArticleData(id: id);
  }
}
