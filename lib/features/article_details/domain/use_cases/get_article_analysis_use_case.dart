import 'package:dartz/dartz.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/core/services/use_case.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/repos/article_details_repo.dart';

class GetArticleAnalysisUseCase extends UseCase<ArticleAnalysisEntity, String> {
  final ArticleDetailsRepo repo;

  GetArticleAnalysisUseCase({required this.repo});

  @override
  Future<Either<Failure, ArticleAnalysisEntity>> call([String id = '']) async {
    // TODO: implement call
    return await repo.getArticleAnalysis(id: id);
  }
}
