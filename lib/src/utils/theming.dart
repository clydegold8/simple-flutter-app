import 'package:flutter/material.dart';
import 'package:k_block_app/src/constants/themes.dart';
import 'package:k_block_app/src/constants/colors.dart';

KBlockTheme getTheme(String name) {
  switch (name) {
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
  }
  return KBlockThemes.simple;
}

KBlockTheme getGradientTheme(String name) {
  switch (name) {
    case ThemeNames.black:
      return KBlockThemes.blackGradient;
    case ThemeNames.skyBlue:
      return KBlockThemes.skyBlueGradient;
    case ThemeNames.pink:
      return KBlockThemes.pinkGradient;
    case ThemeNames.green:
      return KBlockThemes.greenGradient;
    case ThemeNames.yellow:
      return KBlockThemes.yellowGradient;
    case ThemeNames.beige:
      return KBlockThemes.beigeGradient;
  }
  return KBlockThemes.simpleGradient;
}

List<Color> getLinearGradient(String name) {
  switch (name) {
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
