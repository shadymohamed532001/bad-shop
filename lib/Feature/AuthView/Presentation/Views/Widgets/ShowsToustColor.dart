// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ShowTouster({
  required String massage,
  required ToustState state,
}) {
  Fluttertoast.showToast(
    msg: massage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 2,
    backgroundColor: ShowsToustColor(state),
    textColor: MyTheme.whiteColor,
    fontSize: 16.0,
  );
}

enum ToustState {
  SUCCESS,
  ERROR,
  WARNING,
}

Color ShowsToustColor(ToustState state) {
  Color? color;

  switch (state) {
    case ToustState.SUCCESS:
      color = MyTheme.primaryColor;
      break;
    case ToustState.ERROR:
      color = MyTheme.redColor;
      break;
    case ToustState.WARNING:
      color = MyTheme.greyColor;
      break;
  }
  return color;
}
