import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:flutter/material.dart';

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
      // child: Image(
      //     fit: BoxFit.cover,
      //     image: AssetImage(
      //       imagepath[index],
      //     )),
    );
  }
}
