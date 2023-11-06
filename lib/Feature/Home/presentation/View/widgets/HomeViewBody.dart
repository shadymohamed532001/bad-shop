// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/ClipShapes.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CustomtabBar.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/ListOfCatogry.dart';
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
                    Icon(Iconsax.search_normal, color: MyTheme.greyColor),
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
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
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

            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 14,
            //   ),
            //   child: CustomSearchBar(),
            // ),
          ],
        ))
      ],
    );
  }
}

class PopularListViewItems extends StatelessWidget {
  const PopularListViewItems({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
          fit: BoxFit.cover,
          image: AssetImage(
            imagepath[index],
          )),
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
