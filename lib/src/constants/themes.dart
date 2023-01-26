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

  static KBlockTheme black = KBlockTheme(
      name: ThemeNames.black,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.blackPrimary,
              secondary: KBlockColors.blackPrimary,
              surface: KBlockColors.blackSurface,
              surfaceVariant: KBlockColors.blackSurface,
              inversePrimary: Colors.white)));

  static KBlockTheme blackGradient = KBlockTheme(
      name: ThemeNames.black,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.blackGradientPrimary,
              secondary: KBlockColors.blackGradientSecondary,
              surface: KBlockColors.blackGradientSurface,
              surfaceVariant: KBlockColors.blackGradientSurfaceVariant,
              inversePrimary: Colors.white)));

  static KBlockTheme skyBlue = KBlockTheme(
      name: ThemeNames.skyBlue,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.skyBluePrimary,
              secondary: KBlockColors.skyBluePrimary,
              surface: KBlockColors.skyBlueSurface,
              surfaceVariant: KBlockColors.skyBlueSurface,
              inversePrimary: Colors.white)));

  static KBlockTheme skyBlueGradient = KBlockTheme(
      name: ThemeNames.skyBlue,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.skyBlueGradientPrimary,
              secondary: KBlockColors.skyBlueGradientSecondary,
              surface: KBlockColors.skyBlueGradientSurface,
              surfaceVariant: KBlockColors.skyBlueGradientSurfaceVariant,
              inversePrimary: Colors.white)));

  static KBlockTheme pink = KBlockTheme(
      name: ThemeNames.pink,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.pinkPrimary,
              secondary: KBlockColors.pinkPrimary,
              surface: KBlockColors.pinkSurface,
              surfaceVariant: KBlockColors.pinkSurface,
              inversePrimary: Colors.white)));

  static KBlockTheme pinkGradient = KBlockTheme(
      name: ThemeNames.pink,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.pinkGradientPrimary,
              secondary: KBlockColors.pinkGradientSecondary,
              surface: KBlockColors.pinkGradientSurface,
              surfaceVariant: KBlockColors.pinkGradientSurfaceVariant,
              inversePrimary: Colors.white)));

  static KBlockTheme green = KBlockTheme(
      name: ThemeNames.simple,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.greenThemeColor,
              secondary: KBlockColors.greenThemeColor,
              surface: KBlockColors.greenSurface,
              surfaceVariant: KBlockColors.greenSurface,
              inversePrimary: Colors.white)));

  static KBlockTheme greenGradient = KBlockTheme(
      name: ThemeNames.simple,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.greenGradientPrimary,
              secondary: KBlockColors.greenGradientSecondary,
              surface: KBlockColors.greenGradientSurface,
              surfaceVariant: KBlockColors.greenGradientSurfaceVariant,
              inversePrimary: Colors.white)));

  static KBlockTheme yellow = KBlockTheme(
      name: ThemeNames.yellow,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.yellowPrimary,
              secondary: KBlockColors.yellowPrimary,
              surface: KBlockColors.yellowSurface,
              surfaceVariant: KBlockColors.yellowSurface,
              inversePrimary: KBlockColors.foregroundColor)));

  static KBlockTheme yellowGradient = KBlockTheme(
      name: ThemeNames.yellow,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.yellowGradientPrimary,
              secondary: KBlockColors.yellowGradientSecondary,
              surface: KBlockColors.yellowGradientSurface,
              surfaceVariant: KBlockColors.yellowGradientSurfaceVariant,
              inversePrimary: KBlockColors.foregroundColor)));

  static KBlockTheme beige = KBlockTheme(
      name: ThemeNames.beige,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.beigePrimary,
              secondary: KBlockColors.beigePrimary,
              surface: KBlockColors.beigeSurface,
              surfaceVariant: KBlockColors.beigeSurface,
              inversePrimary: KBlockColors.foregroundColor)));

  static KBlockTheme beigeGradient = KBlockTheme(
      name: ThemeNames.beige,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.beigeGradientPrimary,
              secondary: KBlockColors.beigeGradientSecondary,
              surface: KBlockColors.beigeGradientSurface,
              surfaceVariant: KBlockColors.beigeGradientSurfaceVariant,
              inversePrimary: KBlockColors.foregroundColor)));

  static KBlockTheme simple = green;
  static KBlockTheme simpleGradient = greenGradient;
}
