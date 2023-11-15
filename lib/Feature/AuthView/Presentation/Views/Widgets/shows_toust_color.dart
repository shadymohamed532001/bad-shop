import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showTouster({
  required String massage,
  required ToustState state,
}) {
  Fluttertoast.showToast(
    msg: massage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 2,
    backgroundColor: showsToustColor(state),
    textColor: ColorManger.whiteColor,
    fontSize: 16.0,
  );
}

enum ToustState {
  SUCCESS,
  ERROR,
  WARNING,
}

Color showsToustColor(ToustState state) {
  Color? color;

  switch (state) {
    case ToustState.SUCCESS:
      color = ColorManger.primaryColor;
      break;
    case ToustState.ERROR:
      color = ColorManger.redColor;
      break;
    case ToustState.WARNING:
      color = ColorManger.greyColor;
      break;
  }
  return color;
}
