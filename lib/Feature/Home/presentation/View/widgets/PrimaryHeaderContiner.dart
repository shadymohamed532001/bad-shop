import 'package:bag/Core/Uitls/ClipShapes.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CircleContiner.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContiner extends StatelessWidget {
  const PrimaryHeaderContiner({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerHomeClipper(),
      child: Container(
        color: MyTheme.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          child: Stack(
            children: [
              Positioned(
                right: -200,
                top: -200,
                child: CircleContiner(
                  Circlecolor: MyTheme.whiteColor.withOpacity(0.1),
                ),
              ),
              Positioned(
                right: -300,
                top: 100,
                child: CircleContiner(
                  Circlecolor: MyTheme.whiteColor.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
