// // ignore_for_file: file_names

// import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
// import 'package:bag/Core/Uitls/Resourses/StringManger.dart';
// import 'package:bag/Feature/AuthView/Presentation/Views/AuthViewBody.dart';
// import 'package:bag/Feature/Home/presentation/View/HomeView.dart';
// import 'package:bag/Feature/Home/presentation/View/StoreView.dart';
// import 'package:bag/Feature/Home/presentation/View/WishListView.dart';
// import 'package:bag/Feature/OnBordingView/Presentation/Views/OnBordingView.dart';
// import 'package:bag/Feature/SplashView/Presntation/Views/SplashView.dart';
// import 'package:flutter/material.dart';

// class Routes {
//   static const String splashRoute = '/';
//   static const String onBordingRoute = 'onBordingView';
//   static const String authRoute = '/authView';
//   static const String homeRoute = '/homeView';
//   static const String storeRoute = '/storeView';
//   static const String wishListRoute = '/WishListView';
//   static const String profileRoute = '/profileView';
//   static const String searchRoute = '/searchView';
// }

// class RoutesGerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(
//           builder: (context) => const SplashView(),
//         );
//       case Routes.authRoute:
//         return MaterialPageRoute(
//           builder: (context) => AuthViewBody(),
//         );
//       case Routes.onBordingRoute:
//         return MaterialPageRoute(
//           builder: (context) => const OnBordingView(),
//         );
//       case Routes.homeRoute:
//         return MaterialPageRoute(
//           builder: (context) => const HomeView(),
//         );
//       case Routes.storeRoute:
//         return MaterialPageRoute(
//           builder: (context) => const StoreView(),
//         );
//       case Routes.wishListRoute:
//         return MaterialPageRoute(
//           builder: (context) => const WishListView(),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (context) => const ErrorView(),
//         );
//     }
//   }
// }

// class ErrorView extends StatelessWidget {
//   const ErrorView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           AppString.noRouteFounded,
//           style: Theme.of(context)
//               .textTheme
//               .titleLarge!
//               .copyWith(color: ColorManger.redColor),
//         ),
//       ),
//     );
//   }
// }
