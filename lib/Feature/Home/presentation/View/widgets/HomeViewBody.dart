import 'package:bag/Feature/Home/presentation/View/widgets/CustomSerachBar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: CustomSearchBar(),
        ),
      ],
    );
  }
}
