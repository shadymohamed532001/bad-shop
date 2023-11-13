// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/LocalServices.dart';
import 'package:bag/Core/config/routes/routes.dart';
import 'package:flutter/material.dart';

void Submited(BuildContext context) {
  LocalServices.saveData(
    key: 'onbording',
    value: true,
  ).then((value) {
    if (value) {
      PushAndFinsh(context, PageName: Routes.AuthViewRoute);
      print('saved on bording value');
    }
  });
}

void PushAndFinsh(BuildContext context, {required String PageName}) {
  Navigator.pushNamedAndRemoveUntil(context, PageName, (route) => false);
}

void PushOnly(BuildContext context, {required String PageName}) {
  Navigator.pushNamed(context, PageName);
}
