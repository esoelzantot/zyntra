import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/helpers/app_transitions.dart';
import 'package:zyntra/core/routing/end_points.dart';
import 'package:zyntra/features/articles/presentation/views/articles_view.dart';
import 'package:zyntra/features/home/presentation/views/home_view.dart';
import 'package:zyntra/features/library/presentation/views/library_view.dart';
import 'package:zyntra/features/splash/views/splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: EndPoints.homeView,
    routes: [
      // ============================================================
      // Splash Screen - Quick Fade
      // ============================================================
      GoRoute(
        path: EndPoints.splashView,
        name: 'Splash View',
        pageBuilder: (context, state) =>
            AppTransitions.quickFade(state.pageKey, const SplashView()),
      ),

      // ============================================================
      // Home Screen - Smooth Fade
      // ============================================================
      GoRoute(
        path: EndPoints.homeView,
        name: 'Home View',
        pageBuilder: (context, state) =>
            AppTransitions.smoothFade(state.pageKey, const HomeView()),
      ),

      // ============================================================
      // Articles Screen - Smooth Fade
      // ============================================================
      GoRoute(
        path: EndPoints.articlesView,
        name: 'Articles View',
        pageBuilder: (context, state) =>
            AppTransitions.smoothFade(state.pageKey, const ArticlesView()),
      ),

      // ============================================================
      // Articles Screen - Smooth Fade
      // ============================================================
      GoRoute(
        path: EndPoints.libraryView,
        name: 'Library View',
        pageBuilder: (context, state) =>
            AppTransitions.smoothFade(state.pageKey, const LibraryView()),
      ),

      // ============================================================
      // Article Details View - Fade with Scale
      // ============================================================
      // GoRoute(
      //   path: EndPoints.articleDetailsView,
      //   name: 'ArticleDetails',
      //   pageBuilder: (context, state) => AppTransitions.fadeForDetails(
      //     state.pageKey,
      //     ArticleDetailsView(
      //       article: state.extra,
      //     ),
      //   ),
      // ),

      // ============================================================
      // Asky Screen - Smooth Fade
      // ============================================================
      // GoRoute(
      //   path: EndPoints.askyView,
      //   name: 'Asky View',
      //   pageBuilder: (context, state) => AppTransitions.smoothFade(
      //     state.pageKey,
      //     const AskyView(),
      //   ),
      // ),
    ],

    // Custom error page with smooth fade
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.uri.toString()}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  context.go('/'), // Navigate back to home or a default page
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
