import 'package:flutter/material.dart';

import 'colors.dart';

class KBlockTheme {
  String name;
  ThemeData themeData;

  KBlockTheme({required this.name, required this.themeData});
}

class ThemeNames {
  static const String simple = 'simple';
  static const String black = 'black';
  static const String skyBlue = 'skyBlue';
  static const String pink = 'pink';
  static const String green = 'green';
  static const String yellow = 'yellow';
  static const String beige = 'beige';
  static const String gradient = 'gradient';
}

final ThemeData _baseThemeData = ThemeData(fontFamily: 'NunitoSans');

class KBlockThemes {
  KBlockThemes._();

  static Map<String, ThemeData> solid = {
    ThemeNames.simple: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.greenThemeColor,
            secondary: KBlockColors.buttonPositiveBackground,
            tertiary: KBlockColors.buttonAccentForeground,
            tertiaryContainer: KBlockColors.buttonAccentBackground,
            error: KBlockColors.text02,
            errorContainer: Colors.white,
            surface: KBlockColors.greenSurface,
            surfaceVariant: KBlockColors.greenIcon,
            inversePrimary: Colors.white)),
    ThemeNames.black: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.blackPrimary,
            secondary: KBlockColors.blackPrimary,
            tertiary: KBlockColors.blackPrimary,
            tertiaryContainer: KBlockColors.blackAccent,
            error: KBlockColors.foregroundColor,
            errorContainer: KBlockColors.blackSurface,
            surface: KBlockColors.blackSurface,
            surfaceVariant: KBlockColors.blackSurfaceVariant,
            inversePrimary: Colors.white)),
    ThemeNames.skyBlue: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.skyBluePrimary,
            secondary: KBlockColors.skyBluePrimary,
            tertiary: KBlockColors.skyBluePrimary,
            tertiaryContainer: KBlockColors.skyBlueAccent,
            error: Colors.white,
            errorContainer: KBlockColors.skyBluePrimary,
            surface: KBlockColors.skyBlueSurface,
            surfaceVariant: KBlockColors.skyBlueSurfaceVariant,
            inversePrimary: Colors.white)),
    ThemeNames.pink: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.pinkPrimary,
            secondary: KBlockColors.pinkPrimary,
            tertiary: KBlockColors.pinkPrimary,
            tertiaryContainer: KBlockColors.pinkAccent,
            error: Colors.white,
            errorContainer: KBlockColors.pinkPrimary,
            surface: KBlockColors.pinkSurface,
            surfaceVariant: KBlockColors.pinkSurfaceVariant,
            inversePrimary: Colors.white)),
    ThemeNames.green: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.greenPrimary,
            secondary: KBlockColors.greenPrimary,
            tertiary: KBlockColors.greenPrimary,
            tertiaryContainer: KBlockColors.greenAccent,
            error: KBlockColors.text02,
            errorContainer: Colors.white,
            surface: KBlockColors.greenSurface,
            surfaceVariant: KBlockColors.greenSurfaceVariant,
            inversePrimary: Colors.white)),
    ThemeNames.yellow: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.yellowPrimary,
            secondary: KBlockColors.yellowPrimary,
            tertiary: KBlockColors.yellowPrimary,
            tertiaryContainer: KBlockColors.yellowAccent,
            error: KBlockColors.foregroundColor,
            errorContainer: KBlockColors.yellowPrimary,
            surface: KBlockColors.yellowSurface,
            surfaceVariant: KBlockColors.yellowSurfaceVariant,
            inversePrimary: KBlockColors.foregroundColor)),
    ThemeNames.beige: _baseThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: KBlockColors.beigePrimary,
            secondary: KBlockColors.beigePrimary,
            tertiary: KBlockColors.beigePrimary,
            tertiaryContainer: KBlockColors.beigeAccent,
            error: KBlockColors.foregroundColor,
            errorContainer: KBlockColors.beigePrimary,
            surface: KBlockColors.beigeSurface,
            surfaceVariant: KBlockColors.beigeSurfaceVariant,
            inversePrimary: KBlockColors.foregroundColor)),
  };

  static Map<String, List<Color>> linearGradient = {
    ThemeNames.simple: [KBlockColors.greenLG1, KBlockColors.greenLG2],
    ThemeNames.black: [KBlockColors.blackLG1, KBlockColors.blackLG2],
    ThemeNames.skyBlue: [KBlockColors.skyBlueLG1, KBlockColors.skyBlueLG2],
    ThemeNames.pink: [KBlockColors.pinkLG1, KBlockColors.pinkLG2],
    ThemeNames.green: [KBlockColors.greenLG1, KBlockColors.greenLG2],
    ThemeNames.yellow: [KBlockColors.yellowLG1, KBlockColors.yellowLG2],
    ThemeNames.beige: [KBlockColors.beigeLG1, KBlockColors.beigeLG2],
  };
}
