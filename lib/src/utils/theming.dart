import 'package:flutter/material.dart';
import 'package:k_block_app/src/constants/themes.dart';
import 'package:k_block_app/src/constants/colors.dart';

KBlockTheme getTheme(String name) {
  switch (name) {
    case ThemeNames.simple:
      return KBlockThemes.simple;
    case ThemeNames.black:
      return KBlockThemes.black;
    case ThemeNames.skyBlue:
      return KBlockThemes.skyBlue;
    case ThemeNames.pink:
      return KBlockThemes.pink;
    case ThemeNames.green:
      return KBlockThemes.green;
    case ThemeNames.yellow:
      return KBlockThemes.yellow;
    case ThemeNames.beige:
      return KBlockThemes.beige;
    case ThemeNames.gradient:
      return KBlockThemes.gradient;
  }
  return KBlockThemes.simple;
}

List<Color> getThemeGradient(String name) {
  switch (name) {
    case ThemeNames.simple:
      return [KBlockColors.greenGradient1, KBlockColors.greenGradient2];
    case ThemeNames.black:
      return [KBlockColors.blackGradient1, KBlockColors.blackGradient2];
    case ThemeNames.skyBlue:
      return [KBlockColors.skyGradient1, KBlockColors.skyGradient2];
    case ThemeNames.pink:
      return [KBlockColors.pinkGradient1, KBlockColors.pinkGradient2];
    case ThemeNames.green:
      return [KBlockColors.greenGradient1, KBlockColors.greenGradient2];
    case ThemeNames.yellow:
      return [KBlockColors.yellowGradient1, KBlockColors.yellowGradient2];
    case ThemeNames.beige:
      return [KBlockColors.beigeGradient1, KBlockColors.beigeGradient2];
    case ThemeNames.gradient:
      return [KBlockColors.gradientGradient1, KBlockColors.gradientGradient2];
  }
  return [KBlockColors.greenGradient2, KBlockColors.greenGradient2];
}
