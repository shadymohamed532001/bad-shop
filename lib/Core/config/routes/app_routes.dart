import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bag/Core/Uitls/Resourses/StayleManger.dart';
import 'package:bag/Core/Uitls/Resourses/StringManger.dart';
import 'package:bag/Core/Uitls/Resourses/ValuesManger.dart';
import 'package:bag/Core/Uitls/service_locator.dart';
import 'package:bag/Core/config/routes/routes.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/auth_view_body.dart';
import 'package:bag/Feature/Home/presentation/View/home_view.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/manger/cubit/onbording_cubit.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/onbodrding_view.dart';
import 'package:bag/Feature/SplashView/Presntation/Views/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator.get<OnbordingCubit>(),
                  child: OnBordingView(),
                ));

      case Routes.AuthViewRoute:
        return MaterialPageRoute(builder: (context) => AuthViewBody());
      case Routes.HomeViewRoute:
        return MaterialPageRoute(builder: (context) => HomeView());

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
