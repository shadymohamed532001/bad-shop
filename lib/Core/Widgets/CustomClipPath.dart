import 'package:flutter/material.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({
    super.key,
    required this.clipper,
    this.clipHight,
    this.clipWidth,
  });
  final CustomClipper<Path>? clipper;
  final double? clipHight;
  final double? clipWidth;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        height: clipHight,
        width: clipWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(0XFF517261),
              Color(0XFF517261),
            ])),
      ),
    );
  }
}
