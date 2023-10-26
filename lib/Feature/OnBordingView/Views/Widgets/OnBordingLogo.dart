import 'package:flutter/material.dart';

class OnBordingLogo extends StatelessWidget {
  const OnBordingLogo({
    super.key,
    required this.width,
    required this.height,
    required this.image,
  });

  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: MediaQuery.of(context).size.width * .02,
      top: MediaQuery.of(context).size.width * .35,
      child: Image.asset(
        image,
        width: width,
        height: height * 0.3,
      ),
    );
  }
}
