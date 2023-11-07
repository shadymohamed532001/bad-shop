import 'package:bag/AppManager/ColorMangager.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF4F6F5),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: ColorManger.blackColor),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorManger.blackColor),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ColorManger.blackColor),
    ),
  );
}
