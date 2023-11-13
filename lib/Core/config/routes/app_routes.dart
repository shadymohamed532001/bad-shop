import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bag/Core/Uitls/Resourses/StayleManger.dart';
import 'package:bag/Core/Uitls/Resourses/StringManger.dart';
import 'package:bag/Core/Uitls/Resourses/ValuesManger.dart';
import 'package:bag/Core/config/routes/routes.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/AuthViewBody.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/onbodrding_view.dart';
import 'package:bag/Feature/SplashView/Presntation/Views/SplashView.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (context) => const OnBordingView());

      case Routes.AuthViewRoute:
        return MaterialPageRoute(builder: (context) => AuthViewBody());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(AppString.noRouteFounded,
              style: getBoldStyle(
                fontsize: AppSize.s28,
                color: ColorManger.blackColor,
              )),
        ),
      ),
    );
  }
}
