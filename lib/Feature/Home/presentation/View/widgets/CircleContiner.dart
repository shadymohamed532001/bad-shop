import 'package:flutter/material.dart';

class CircleContiner extends StatelessWidget {
  const CircleContiner({
    super.key,
    this.width = 400,
    this.heignt = 400,
    this.Circlecolor,
    this.child,
    this.margin,
    this.borderRadius,
    this.padding,
  });
  final double? width;
  final double? heignt;
  final Color? Circlecolor;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heignt,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Circlecolor,
      ),
      child: child,
    );
  }
}
