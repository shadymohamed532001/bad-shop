import 'package:bag/AppManager/FontManager.dart';
import 'package:flutter/material.dart';

TextStyle _getTexStyle(
  double fontsize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(fontSize: fontsize, color: color, fontWeight: fontWeight);
}

// Regular Text Style

TextStyle getRegularStyle({
  double fontsize = FontSize.s14,
  required FontWeight fontWeight,
  Color color,
}) {
  return _getTexStyle(fontsize, fontWeight, color);
}
