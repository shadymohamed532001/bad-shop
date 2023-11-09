import 'package:bag/AppManager/ColorMangager.dart';
import 'package:bag/AppManager/StayleManger.dart';
import 'package:bag/AppManager/ValuesManger.dart';
import 'package:flutter/material.dart';

ThemeData getAppThem() {
  return ThemeData(
      // Main Colors
      primaryColor: ColorManger.primaryColor,
      primaryColorLight: ColorManger.lightprimaryColor,
      primaryColorDark: ColorManger.darkprimaryColor,
      disabledColor: ColorManger.greyColor,
      splashColor: ColorManger
          .lightprimaryColor, // when press the bottom  he effect color
      // Scacfold Theam
      scaffoldBackgroundColor: ColorManger.whiteColor,
      // AppBar Them
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      // Text Them
      textTheme: TextTheme(
          titleLarge:
              getBoldStyle(color: ColorManger.greyColor, fontsize: AppSize.s28),
          titleMedium: getMediumStyle(
              color: ColorManger.greyColor, fontsize: AppSize.s18),
          titleSmall: getMediumStyle(
              color: ColorManger.greyColor, fontsize: AppSize.s12))
      // Input Them
      );
}
