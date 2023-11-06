import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
      onDestinationSelected: (index) {
        BlocProvider.of<HomeCubit>(context).ChangeBottomIndex(index);
      },
      indicatorColor: MyTheme.primaryColor.withOpacity(.25),
      height: MediaQuery.of(context).size.width * .17,
      elevation: 0,
      destinations: const [
        NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
        NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
        // NavigationDestination(icon: Icon(Iconsax.shopping_bag), label: 'Bag'),
        NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
        NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
      ],
    );
  }
}
