import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProudectSlider extends StatelessWidget {
  const ProudectSlider({
    super.key,
    this.width2,
  });

  final double? width2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .24,
      child: FutureBuilder(
        future: BlocProvider.of<HomeCubit>(context).HomeGetData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var homeModel2 = BlocProvider.of<HomeCubit>(context).homeModel!;
            return Padding(
              padding: const EdgeInsets.all(14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        scrollDirection: Axis.horizontal,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        initialPage: 0,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1500)),
                    items: homeModel2.data!.banners!
                        .map((e) => Image(
                              image: NetworkImage(e.image!),
                              fit: BoxFit.contain,
                            ))
                        .toList()),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
