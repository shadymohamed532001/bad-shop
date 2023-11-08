import 'package:bag/AppManager/ColorMangager.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/CircleContiner.dart';
import 'package:bag/Feature/Home/presentation/ViewModels/HomeModel/home_model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProudectCardItemVertical extends StatelessWidget {
  const ProudectCardItemVertical(
      {super.key, required this.homeModel, required this.index});
  final HomeModel homeModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: ColorManger.whiteColor,
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
            // Circlecolor: ColorManger.whiteColor,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: NetworkImage(
                      homeModel.data!.products![index].images!.first,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 12,
                  child: CircleContiner(
                    width: 40,
                    heignt: 30,
                    borderRadius: BorderRadius.circular(12),
                    Circlecolor: ColorManger.yellowColor,
                    child: Center(
                      child: Text(
                        '${homeModel.data!.products![index].discount}\%',
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
                    Circlecolor: ColorManger.whiteColor,
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
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${homeModel.data!.products![index].name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                    Text('\$ ${homeModel.data!.products![index].price}'),
                    CircleContiner(
                      width: 50,
                      heignt: 50,
                      Circlecolor: ColorManger.primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.add,
                          color: ColorManger.whiteColor,
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
