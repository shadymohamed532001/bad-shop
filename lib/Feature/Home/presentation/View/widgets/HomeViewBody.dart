// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CustomtabBar.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/ListOfCatogry.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/PopularListViewItems.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/PrimaryHeaderContiner.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/ProudectSlider.dart';
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
              const ProudectSlider()
            ],
          ),
        )
      ],
    );
  }
}
