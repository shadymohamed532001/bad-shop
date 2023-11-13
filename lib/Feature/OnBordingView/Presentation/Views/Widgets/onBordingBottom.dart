import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bag/Core/Uitls/AppStyles.dart';
import 'package:bag/Core/Uitls/functions.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/Widgets/ListOfOnBordingContinet.dart';
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
    return SizedBox(
      // margin: const EdgeInsets.only(bottom: 30, top: 30),
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (currnetIndex == continte.length - 1) {
            Submited(context);
          }
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManger.primaryColor,
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
