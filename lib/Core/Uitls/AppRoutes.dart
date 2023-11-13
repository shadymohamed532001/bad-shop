// ignore_for_file: constant_identifier_names

import 'package:bag/Feature/AuthView/Presentation/Views/AuthViewBody.dart';

import 'package:bag/Feature/Home/presentation/View/HomeView.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/onbodrding_view.dart';
import 'package:bag/Feature/SplashView/Presntation/Views/SplashView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String KhomeView = '/HomeView';
  static const String KbookDietilsView = '/booksDetailsView';
  static const String KbookonBording = '/OnBordingView';
  static const String KLoginView = '/LoginView';
  static const String KSignUpView = '/SignUpView';

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
        builder: (context, state) => AuthViewBody(),
      ),
      // GoRoute(
      //   path: KSignUpView,
      //   builder: (context, state) => const SignUpView(),
      // ),
      GoRoute(
        path: KhomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
