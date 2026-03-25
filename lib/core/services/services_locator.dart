import 'package:get_it/get_it.dart';
import 'package:zyntra/core/apis/api_services.dart';
import 'package:zyntra/core/cache/articles_cache_service_factory.dart';
import 'package:zyntra/core/cache/threads_cache_service_factory.dart';
import 'package:zyntra/features/article_details/data/data_sources/local/article_details_local_data_source_impl.dart';
import 'package:zyntra/features/article_details/data/data_sources/remote/article_details_remote_data_source_impl.dart';
import 'package:zyntra/features/article_details/data/repos/article_details_repo_impl.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_analysis_use_case.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_data_use_case.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_mindmap_use_case.dart';
import 'package:zyntra/features/articles/data/data_sources/local/articles_local_data_source_impl.dart';
import 'package:zyntra/features/articles/data/data_sources/remote/articles_remote_data_source_impl.dart';
import 'package:zyntra/features/articles/data/repos/articles_repo_impl.dart';
import 'package:zyntra/features/articles/domain/use_cases/get_all_articles_use_case.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/local/asky_local_data_source_impl.dart';
import 'package:zyntra/features/asky_ai/data/data_sources/remote/asky_remote_data_source_impl.dart';
import 'package:zyntra/features/asky_ai/data/repos/asky_repo_impl.dart';
import 'package:zyntra/features/asky_ai/domain/use_cases/get_all_threads_use_case.dart';
import 'package:zyntra/features/asky_ai/domain/use_cases/send_query_use_case.dart';
import 'package:zyntra/features/home/data/data_sources/local/home_local_data_source_impl.dart';
import 'package:zyntra/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:zyntra/features/home/data/repos/home_repo_impl.dart';
import 'package:zyntra/features/home/domain/use_cases/get_newest_articles_use_case.dart';
import 'package:zyntra/features/library/data/data_sources/local/library_local_data_source_impl.dart';
import 'package:zyntra/features/library/data/repos/library_repo_impl.dart';
import 'package:zyntra/features/library/domain/use_cases/get_saved_articles_use_case.dart';
import 'package:zyntra/features/library/domain/use_cases/remove_article_use_case.dart';
import 'package:zyntra/features/library/domain/use_cases/save_article_use_case.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices());

  getIt.registerSingleton<ArticlesCacheServiceFactory>(
    ArticlesCacheServiceFactory(),
  );

  getIt.registerSingleton<ThreadsCacheServiceFactory>(
    ThreadsCacheServiceFactory(),
  );

  // HOME FEATURE
  getIt.registerSingleton<HomeLocalDataSourceImpl>(
    HomeLocalDataSourceImpl(cacheFactory: getIt<ArticlesCacheServiceFactory>()),
  );

  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(
      api: getIt<ApiServices>(),
      cacheFactory: getIt<ArticlesCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      local: getIt.get<HomeLocalDataSourceImpl>(),
      remote: getIt.get<HomeRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<GetNewestArticlesUseCase>(
    GetNewestArticlesUseCase(repo: getIt.get<HomeRepoImpl>()),
  );

  // ARTICLES FEATURE
  getIt.registerSingleton<ArticlesLocalDataSourceImpl>(
    ArticlesLocalDataSourceImpl(
      cacheFactory: getIt<ArticlesCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<ArticlesRemoteDataSourceImpl>(
    ArticlesRemoteDataSourceImpl(
      api: getIt<ApiServices>(),
      cacheFactory: getIt<ArticlesCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<ArticlesRepoImpl>(
    ArticlesRepoImpl(
      local: getIt.get<ArticlesLocalDataSourceImpl>(),
      remote: getIt.get<ArticlesRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<GetAllArticlesUseCase>(
    GetAllArticlesUseCase(repo: getIt.get<ArticlesRepoImpl>()),
  );

  // LIBRARY FEATURE
  getIt.registerSingleton<LibraryLocalDataSourceImpl>(
    LibraryLocalDataSourceImpl(
      cacheFactory: getIt<ArticlesCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<LibraryRepoImpl>(
    LibraryRepoImpl(local: getIt.get<LibraryLocalDataSourceImpl>()),
  );

  getIt.registerSingleton<GetSavedArticlesUseCase>(
    GetSavedArticlesUseCase(repo: getIt.get<LibraryRepoImpl>()),
  );

  getIt.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(repo: getIt.get<LibraryRepoImpl>()),
  );

  getIt.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(repo: getIt.get<LibraryRepoImpl>()),
  );

  // ARTICLE DETAILS FEATURE
  getIt.registerSingleton<ArticleDetailsLocalDataSourceImpl>(
    ArticleDetailsLocalDataSourceImpl(
      cacheFactory: getIt<ArticlesCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<ArticleDetailsRemoteDataSourceImpl>(
    ArticleDetailsRemoteDataSourceImpl(
      api: getIt<ApiServices>(),
      cacheFactory: getIt<ArticlesCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<ArticleDetailsRepoImpl>(
    ArticleDetailsRepoImpl(
      local: getIt.get<ArticleDetailsLocalDataSourceImpl>(),
      remote: getIt.get<ArticleDetailsRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<GetArticleDataUseCase>(
    GetArticleDataUseCase(repo: getIt.get<ArticleDetailsRepoImpl>()),
  );

  getIt.registerSingleton<GetArticleAnalysisUseCase>(
    GetArticleAnalysisUseCase(repo: getIt.get<ArticleDetailsRepoImpl>()),
  );

  getIt.registerSingleton<GetArticleMindmapUseCase>(
    GetArticleMindmapUseCase(repo: getIt.get<ArticleDetailsRepoImpl>()),
  );

  // ASKY FEATURE
  getIt.registerSingleton<AskyLocalDataSourceImpl>(
    AskyLocalDataSourceImpl(cacheFactory: getIt<ThreadsCacheServiceFactory>()),
  );

  getIt.registerSingleton<AskyRemoteDataSourceImpl>(
    AskyRemoteDataSourceImpl(
      api: getIt<ApiServices>(),
      cacheFactory: getIt<ThreadsCacheServiceFactory>(),
    ),
  );

  getIt.registerSingleton<AskyRepoImpl>(
    AskyRepoImpl(
      local: getIt.get<AskyLocalDataSourceImpl>(),
      remote: getIt.get<AskyRemoteDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<GetAllThreadsUseCase>(
    GetAllThreadsUseCase(repo: getIt.get<AskyRepoImpl>()),
  );

  getIt.registerSingleton<SendQueryUseCase>(
    SendQueryUseCase(repo: getIt.get<AskyRepoImpl>()),
  );
}
