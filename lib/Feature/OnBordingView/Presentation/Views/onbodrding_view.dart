import 'package:bag/Feature/OnBordingView/Presentation/Views/Widgets/onbording_view_body.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/manger/cubit/onbording_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = 'OnBording';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
          return OnboardingViewBody(
            cubit: BlocProvider.of<OnbordingCubit>(context),
          );
        },
      ),
    );
  }
}
