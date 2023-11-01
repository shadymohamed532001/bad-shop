import 'package:bag/Core/Uitls/assets.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/HomeViewBody.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.applogoBlack,
          height: 50,
          width: 50,
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
