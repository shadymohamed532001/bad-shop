import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar(
      {super.key,
      this.onPressedleadin,
      this.iconLeading,
      this.actions,
      this.showBackArrow = false,
      this.title});

  final bool showBackArrow;
  final void Function()? onPressedleadin;
  final IconData? iconLeading;
  final List<Widget>? actions;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Iconsax.arrow_left))
          : iconLeading != null
              ? IconButton(onPressed: onPressedleadin, icon: Icon(iconLeading))
              : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.3);
}
