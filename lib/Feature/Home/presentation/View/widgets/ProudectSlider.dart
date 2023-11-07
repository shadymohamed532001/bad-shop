import 'package:bag/AppManager/ColorMangager.dart';
import 'package:bag/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/ProudectCardItemVertical.dart';
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
    return FutureBuilder(
      future: BlocProvider.of<HomeCubit>(context).HomeGetData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var homeModel2 = BlocProvider.of<HomeCubit>(context).homeModel!;
          var map = homeModel2.data!.banners!.map((e) => Image(
                image: NetworkImage(e.image!),
                fit: BoxFit.contain,
              ));
          return Column(
            children: [
              Padding(
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
                      items: map.toList()),
                ),
              ),
              GridView.count(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 1 / 1.44,
                mainAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    map.length,
                    (index) => ProudectCardItemVertical(
                          homeModel: homeModel2,
                          index: index,
                        )),
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: ColorManger.primaryColor,
          ),
        );
      },
    );
  }
}
