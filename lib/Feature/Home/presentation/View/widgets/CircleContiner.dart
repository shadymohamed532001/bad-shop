import 'package:flutter/material.dart';

class CircleContiner extends StatelessWidget {
  const CircleContiner({
    super.key,
    this.width = 400,
    this.heignt = 400,
    this.Circlecolor,
    this.child,
    this.margin,
  });
  final double? width;
  final double? heignt;
  final Color? Circlecolor;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heignt,
      margin: margin,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Circlecolor,
      ),
      child: child,
    );
  }
}
