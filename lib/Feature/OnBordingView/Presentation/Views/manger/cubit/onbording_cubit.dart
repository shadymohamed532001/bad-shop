import 'package:bag/Core/Uitls/functions.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/Widgets/list_of_onbording_continet.dart';
import 'package:bag/Feature/OnBordingView/data/models/on_bording_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(OnbordingInitial());

  List<OnBordingModel> onBoardingPages = continte;

  void onChangePageIndex(
      int index, BuildContext context, PageController pageController) {
    if (index == onBoardingPages.length - 1) {
      Submited(context);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
    emit(PageViewIndexChangedState());
  }
}
