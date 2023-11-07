// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CircleContiner.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CustomtabBar.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/ListOfCatogry.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/PopularListViewItems.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/PrimaryHeaderContiner.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/ProudectSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    var width2 = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              PrimaryHeaderContiner(
                child: Column(
                  children: [
                    CustomHomeAppBar(
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.shopping_bag))
                      ],
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good day for shopping',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: MyTheme.whiteColor.withOpacity(0.7),
                                    fontSize: 16,
                                    fontFamily: 'Poppins'),
                          ),
                          Text(
                            'Bag Store',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 22,
                                    color: MyTheme.whiteColor,
                                    fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: width2 * .05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: width2 * 1,
                        height: width2 * .12,
                        decoration: BoxDecoration(
                            color: MyTheme.whiteColor,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(Iconsax.search_normal,
                                color: MyTheme.greyColor),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                // style: TextStyle(color:),
                                onTapOutside: (Event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: MyTheme.greyColor,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(33),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onFieldSubmitted: (value) {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width2 * .04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Popular Category',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: MyTheme.whiteColor.withOpacity(.8),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagepath.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                PopularListViewItems(
                                  index: index,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  categoryName[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: MyTheme.whiteColor),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const ProudectSlider(),
              const ProudectCardVertical()
            ],
          ),
        )
      ],
    );
  }
}

class ProudectCardVertical extends StatelessWidget {
  const ProudectCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: MyTheme.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 7,
            offset: const Offset(3, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleContiner(
            heignt: 180,
            // Circlecolor: MyTheme.whiteColor,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: NetworkImage(BlocProvider.of<HomeCubit>(context)
                        .homeModel!
                        .data!
                        .products![1]
                        .images!
                        .first),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 12,
                  child: CircleContiner(
                    width: 40,
                    heignt: 30,
                    borderRadius: BorderRadius.circular(12),
                    Circlecolor: MyTheme.yellowColor,
                    child: Center(
                      child: Text(
                        '25%',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 12,
                                ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 12,
                  child: CircleContiner(
                    width: 45,
                    heignt: 38,
                    borderRadius: BorderRadius.circular(50),
                    Circlecolor: MyTheme.whiteColor,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('MacBook Pro M1 '),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text('Apple'),
                    Icon(
                      Iconsax.verify5,
                      color: Colors.blue,
                      size: 14,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$888'),
                    CircleContiner(
                      width: 50,
                      heignt: 50,
                      Circlecolor: MyTheme.primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.add,
                          color: MyTheme.whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
