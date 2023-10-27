import 'package:bag/Core/Uitls/AppStyles.dart';
import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Feature/OnBordingView/Views/Widgets/ListOfOnBordingContinet.dart';
import 'package:flutter/material.dart';

class CustomOnBordBottom extends StatelessWidget {
  const CustomOnBordBottom({
    super.key,
    required this.currnetIndex,
    required this.pageController,
  });

  final int currnetIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50, top: 30),
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (currnetIndex == continte.length - 1) {
            // GoRouter.of(context).pushReplacement(AppRouter.KhomeView);
          }
          pageController.nextPage(
              duration: const Duration(microseconds: 100),
              curve: Curves.bounceIn);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          currnetIndex == continte.length - 1 ? 'Get Started Now' : 'Next',
          style: appStyle.textStyle18,
        ),
      ),
    );
  }
}
