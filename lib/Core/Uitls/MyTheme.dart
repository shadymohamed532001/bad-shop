import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff517261);
  static Color blackColor = const Color(0xff1E1E1E);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color greyColor = const Color(0xffA7A6A5);
  static Color RedColor = const Color(0xFFBE2B21);

  static Color greyColorBackGround = const Color(0xffE2E3E2);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF4F6F5),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w500, color: blackColor),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: greyColor),
    ),
  );
}
