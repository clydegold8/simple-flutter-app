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

List<Color> getLinearGradient(String name) {
  switch (name) {
    case ThemeNames.simple:
      return [KBlockColors.greenLG1, KBlockColors.greenLG2];
    case ThemeNames.black:
      return [KBlockColors.blackLG1, KBlockColors.blackLG2];
    case ThemeNames.skyBlue:
      return [KBlockColors.skyBlueLG1, KBlockColors.skyBlueLG2];
    case ThemeNames.pink:
      return [KBlockColors.pinkLG1, KBlockColors.pinkLG2];
    case ThemeNames.green:
      return [KBlockColors.greenLG1, KBlockColors.greenLG2];
    case ThemeNames.yellow:
      return [KBlockColors.yellowLG1, KBlockColors.yellowLG2];
    case ThemeNames.beige:
      return [KBlockColors.beigeLG1, KBlockColors.beigeLG2];
  }
  return [KBlockColors.greenLG1, KBlockColors.greenLG2];
}
