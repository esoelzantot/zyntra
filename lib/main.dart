import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zyntra/core/routing/router.dart';
import 'package:zyntra/core/services/services_locator.dart';
import 'package:zyntra/core/services/simple_bloc_observer.dart';
import 'package:zyntra/core/utils/app_colors.dart';

Future<void> hiveSetup() async {
  // initializing hive
  await Hive.initFlutter();

  // registering adapters
  // Hive.registerAdapter(BookEntityAdapter());

  // opening boxes
  // await Hive.openBox<BookEntity>(HiveConstants.FEATURED_BOOKS_BOX);
  // await Hive.openBox<BookEntity>(HiveConstants.NEWEST_BOOKS_BOX);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  await hiveSetup();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      },
    ),
  );

  // runApp(const MyApp());
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
