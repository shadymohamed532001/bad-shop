import 'package:bag/Feature/OnBordingView/Presentation/Views/Widgets/OnBordingViewBody.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingViewBody(),
    );
  }
}
