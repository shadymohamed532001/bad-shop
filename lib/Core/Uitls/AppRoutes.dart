// ignore_for_file: constant_identifier_names

import 'package:bag/Feature/AuthView/Presentation/Views/LoginView.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/OnBordingView.dart';
import 'package:bag/Feature/SplashView/Presntation/Views/SplashView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  // static const String KhomeView = '/HomeView';
  // static const String KSearchsView = '/SearchView';
  static const String KbookDietilsView = '/booksDetailsView';
  static const String KbookonBording = '/OnBordingView';
  static const String KLoginView = '/LoginView';

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KbookonBording,
        builder: (context, state) => const OnBordingView(),
      ),
      GoRoute(
        path: KLoginView,
        builder: (context, state) => const LoginView(),
      ),
      // GoRoute(
      //   path: KbookDietilsView,
      //   builder: (context, state) => const booksDetailsView(),
      // ),
    ],
  );
}
