import 'package:bag/Core/Uitls/Resourses/FontManager.dart';
import 'package:flutter/material.dart';

// main function the all type return it
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
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.regular, color);
}

// medium Text Style

TextStyle getMediumStyle({
  double fontsize = FontSize.s14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.medium, color);
}

// bold Text Style

TextStyle getBoldStyle({
  double fontsize = FontSize.s14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.bold, color);
}

// semibold Text Style

TextStyle getSemiboldStyle({
  double fontsize = FontSize.s14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.semibold, color);
}

// light Text Style

TextStyle getlightStyle({
  double fontsize = FontSize.s14,
  required Color color,
}) {
  return _getTexStyle(fontsize, FontWeightManager.light, color);
}
