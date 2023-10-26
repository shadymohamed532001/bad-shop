import 'package:bag/Core/Uitls/ClipShapes.dart';
import 'package:bag/Core/Widgets/CustomClipPath.dart';
import 'package:bag/Feature/OnBordingView/Views/Widgets/OnBordingLogo.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            CustomClipPath(
              clipHight: height,
              clipper: Container3Clipper(),
            ),
            OnBordingLogo(
              image: 'assets/images/onBordingimage1.png',
              width: width,
              height: height,
            ),
            const Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'We are the ones who stand by your side in times of need',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
