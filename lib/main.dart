import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zyntra/core/constants/hive_constants.dart';
import 'package:zyntra/core/cubits/book_mark_cubit.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/routing/router.dart';
import 'package:zyntra/core/services/services_locator.dart';
import 'package:zyntra/core/services/simple_bloc_observer.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';
import 'package:zyntra/features/article_details/domain/entities/article_data_entity.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_analysis_use_case.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_data_use_case.dart';
import 'package:zyntra/features/article_details/domain/use_cases/get_article_mindmap_use_case.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_analysis/get_article_analysis_cubit.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_data/get_article_data_cubit.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_map/get_article_map_cubit.dart';
import 'package:zyntra/features/articles/domain/use_cases/get_all_articles_use_case.dart';
import 'package:zyntra/features/articles/presentation/cubits/get_all_articles/get_all_articles_cubit.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';
import 'package:zyntra/features/asky_ai/domain/use_cases/get_all_messages_use_case.dart';
import 'package:zyntra/features/asky_ai/domain/use_cases/send_query_use_case.dart';
import 'package:zyntra/features/asky_ai/presentation/cubits/get_messages/get_messages_cubit.dart';
import 'package:zyntra/features/asky_ai/presentation/cubits/send_query/send_query_cubit.dart';
import 'package:zyntra/features/home/domain/use_cases/get_newest_articles_use_case.dart';
import 'package:zyntra/features/home/presentation/cubits/newest_articles/get_newest_articles_cubit.dart';
import 'package:zyntra/features/library/data/repos/library_repo_impl.dart';
import 'package:zyntra/features/library/domain/use_cases/get_saved_articles_use_case.dart';
import 'package:zyntra/features/library/domain/use_cases/remove_article_use_case.dart';
import 'package:zyntra/features/library/domain/use_cases/save_article_use_case.dart';
import 'package:zyntra/features/library/presentation/cubits/get_saved_articles/get_saved_articles_cubit.dart';

Future<void> hiveSetup() async {
  // initializing hive
  await Hive.initFlutter();

  // registering adapters
  Hive.registerAdapter(ArticleEntityAdapter());
  Hive.registerAdapter(ArticleDataEntityAdapter());
  Hive.registerAdapter(ArticleAnalysisEntityAdapter());
  Hive.registerAdapter(MessageEntityAdapter());
  Hive.registerAdapter(ResourceEntityAdapter());

  // opening boxes
  await Hive.openBox(HiveConstants.NEWEST_ARTICLES_BOX);
  await Hive.openBox(HiveConstants.ALL_ARTICLES_BOX);
  await Hive.openBox(HiveConstants.ALL_MESSAGES_BOX);
  await Hive.openBox(HiveConstants.SAVED_ARTICLES_BOX);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  await hiveSetup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNewestArticlesCubit(
            useCase: getIt.get<GetNewestArticlesUseCase>(),
          )..getNewestArticles(),
        ),

        BlocProvider(
          create: (context) =>
              GetAllArticlesCubit(useCase: getIt.get<GetAllArticlesUseCase>())
                ..getAllArticles(page: 1),
        ),

        BlocProvider(
          create: (context) => GetSavedArticlesCubit(
            useCase: getIt.get<GetSavedArticlesUseCase>(),
          )..getSavedArticles(page: 1),
        ),

        BlocProvider(
          create: (context) => BookmarkCubit(
            saveArticleUseCase: getIt.get<SaveArticleUseCase>(),
            removeArticleUseCase: getIt.get<RemoveArticleUseCase>(),
            repo: getIt.get<LibraryRepoImpl>(),
          ),
        ),

        BlocProvider(
          create: (context) =>
              GetArticleDataCubit(useCase: getIt.get<GetArticleDataUseCase>()),
        ),

        BlocProvider(
          create: (context) => GetArticleMapCubit(
            useCase: getIt.get<GetArticleMindmapUseCase>(),
          ),
        ),

        BlocProvider(
          create: (context) => GetArticleAnalysisCubit(
            useCase: getIt.get<GetArticleAnalysisUseCase>(),
          ),
        ),

        BlocProvider(
          create: (context) =>
              SendQueryCubit(useCase: getIt.get<SendQueryUseCase>()),
        ),

        BlocProvider(
          create: (context) =>
              GetMessagesCubit(useCase: getIt.get<GetAllMessagesUseCase>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zyntra',
      routerConfig: AppRouter.router,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
    );
  }
}
