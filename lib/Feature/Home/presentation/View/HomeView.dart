// ignore_for_file: non_constant_identifier_names

import 'package:bag/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CustomNavigtionBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var Cubite = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          // appBar: AppBar(
          //   title: Image.asset(
          //     AppAssets.applogoBlack,
          //     height: 50,
          //     width: 50,
          //   ),
          // ),
          body: Cubite.NavBarScreans[Cubite.currentIndex],
          bottomNavigationBar: CustomBottomNavBar(),
        );
      },
    );
  }
}
