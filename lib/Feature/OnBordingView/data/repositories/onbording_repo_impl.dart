import 'package:bag/Core/Uitls/local_services.dart';
import 'package:bag/Core/Uitls/functions.dart';
import 'package:bag/Core/config/routes/routes.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/Widgets/list_of_onbording_continet.dart';
import 'package:bag/Feature/OnBordingView/data/models/on_bording_model.dart';
import 'package:bag/Feature/OnBordingView/data/repositories/onbording_repo.dart';
import 'package:flutter/material.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  void navigateToAuth({required BuildContext context}) {
    LocalServices.saveData(
      key: 'onbording',
      value: true,
    ).then((value) {
      if (value) {
        PushAndFinsh(context, PageName: Routes.AuthViewRoute);
        print('saved on bording value');
      }
    });
  }

  @override
  List<OnBordingModel> onBoardingPages() {
    return continte;
  }

  @override
  void navigateBetweenPages(
      {required BuildContext context,
      required PageController pageController,
      required bool isLastBoarding}) {
    if (isLastBoarding) {
      navigateToAuth(context: context);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }
}
