import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({
    super.key,
    this.onTapItem1,
    this.onTapItem2,
    this.onTapItem3,
  });
  final void Function()? onTapItem1;
  final void Function()? onTapItem2;
  final void Function()? onTapItem3;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints.expand(width: 130, height: 115),
        elevation: 0.0,
        enableFeedback: true,
        // splashRadius: 12.3,
        color: MyTheme.greyColorBackGround,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyTheme.greyColorBackGround,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        icon: const Icon(
          Iconsax.menu_board,
          color: Colors.black,
        ),
        itemBuilder: (BuildContext bc) {
          return [
            PopupMenuItem(
              onTap: onTapItem1,
              child: const Text("Contact Us"),
            ),
            PopupMenuItem(
              onTap: onTapItem2,
              child: const Text("Sign Out"),
            ),
          ];
        });
  }
}
