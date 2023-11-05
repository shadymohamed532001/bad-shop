// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/ClipShapes.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CustomSerachBar.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CustomtabBar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryHeaderContiner(
            child: Column(
          children: [
            CustomHomeAppBar(
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.shopping_bag))
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good day for shopping',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.whiteColor.withOpacity(0.7),
                        fontSize: 16,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Bag Store',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 22,
                        color: MyTheme.whiteColor,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: CustomSearchBar(),
            ),
          ],
        ))
      ],
    );
  }
}

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

class CircleContiner extends StatelessWidget {
  const CircleContiner({
    super.key,
    this.width = 400,
    this.heignt = 400,
    this.Circlecolor,
    this.child,
  });
  final double? width;
  final double? heignt;
  final Color? Circlecolor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heignt,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Circlecolor,
      ),
      child: child,
    );
  }
}
