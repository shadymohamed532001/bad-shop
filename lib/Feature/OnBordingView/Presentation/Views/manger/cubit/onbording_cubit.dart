import 'package:bag/Feature/OnBordingView/data/models/on_bording_model.dart';
import 'package:bag/Feature/OnBordingView/data/repositories/onbording_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  final OnBoardingRepo onBoardingRepo;

  OnbordingCubit({required this.onBoardingRepo}) : super(OnbordingInitial());

  bool isLastBoarding = false;
  List<OnBordingModel> onBoardingPages() {
    return onBoardingRepo.onBoardingPages();
  }

  int? index;
  void onChangePageIndex(index) {
    if (index == onBoardingPages().length - 1) {
      isLastBoarding = true;
    } else {
      isLastBoarding = false;
    }
    emit(PageViewIndexChangedState());
  }

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
  }) {
    onBoardingRepo.navigateBetweenPages(
      context: context,
      pageController: pageController,
      isLastBoarding: isLastBoarding,
    );

    emit(NavigateBetweenPages());
  }

  void navigateToLoginOrHome({required BuildContext context}) {
    onBoardingRepo.navigateToAuth(context: context);

    emit(SkipToSignInOrHome());
  }
}
