// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/AppRoutes.dart';
import 'package:bag/Core/Uitls/ClipShapes.dart';
import 'package:bag/Core/Uitls/assets.dart';
import 'package:bag/Core/Widgets/CustomClipPath.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    NavigateToOnBording();
    tweenanimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomClipPath(
          clipHight: MediaQuery.of(context).size.height / 1,
          clipWidth: double.infinity,
          clipper: Container1Clipper(),
        ),
        CustomClipPath(
          clipHight: MediaQuery.of(context).size.height / 1,
          clipWidth: double.infinity,
          clipper: Container2Clipper(),
        ),
        AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return FadeTransition(
                opacity: animation,
                child: Center(
                    child: Image.asset(
                  AppAssets.appLogo,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 6,
                )),
              );
            })
      ],
    );
  }

  void tweenanimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animation = Tween<double>(begin: 0, end: 1.8).animate(animationController);
    animationController.forward();
  }

  void NavigateToOnBording() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.KbookonBording);
    });
  }
}
