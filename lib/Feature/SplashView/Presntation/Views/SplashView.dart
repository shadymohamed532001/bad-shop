import 'package:bag/Feature/SplashView/Presntation/Views/Widgets/SplashViewBody.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff4C6B5B),
      body: SplashViewBody(),
    );
  }
}
