import 'package:bag/Feature/OnBordingView/data/models/on_bording_model.dart';
import 'package:flutter/material.dart';

abstract class OnBoardingRepo {
  List<OnBordingModel> onBoardingPages();

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  });

  void navigateToAuth({required BuildContext context});
}
