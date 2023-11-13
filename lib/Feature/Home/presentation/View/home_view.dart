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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var Cubite = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            body: Cubite.NavBarScreans[Cubite.currentIndex],
            bottomNavigationBar: CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}
