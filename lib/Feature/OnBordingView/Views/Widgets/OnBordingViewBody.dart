// ignore_for_file: file_names

import 'package:bag/Core/Uitls/ClipShapes.dart';
import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Core/Widgets/CustomClipPath.dart';
import 'package:bag/Feature/OnBordingView/Views/Widgets/CustomSkiper.dart';
import 'package:bag/Feature/OnBordingView/Views/Widgets/ListOfOnBordingContinet.dart';
import 'package:bag/Feature/OnBordingView/Views/Widgets/OnBordingLogo.dart';
import 'package:bag/Feature/OnBordingView/Views/Widgets/onBordingBottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currnetIndex = 0;
  late PageController pageController;

  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          currnetIndex = value;
        });
      },
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
            CustomSkiper(
              onTap: () {},
            ),
            OnBordingLogo(
              image: continte[index].imagepath!,
              width: width,
              height: height,
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .5,
                    ),
                    Text(
                      continte[index].tittle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff333333),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(continte[index].subtittle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color(0xff848484),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      height: height * .1,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => Container(
                                      height: 7,
                                      width: currnetIndex == index ? 30 : 10,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kPrimaryColor,
                                      ),
                                    )),
                          ),
                          CustomOnBordBottom(
                            currnetIndex: currnetIndex,
                            pageController: pageController,
                          ),
                        ],
                      ),
                    )
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
