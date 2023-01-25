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

  static KBlockTheme simple = KBlockTheme(
      name: ThemeNames.simple,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.greenThemeColor,
              secondary: KBlockColors.greenThemeColor,
              surface: KBlockColors.greenSurface,
              surfaceVariant: KBlockColors.greenSurface,
              surfaceTint: KBlockColors.foregroundColor)));

  static KBlockTheme black = KBlockTheme(
      name: ThemeNames.black,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.blackPrimary,
              secondary: KBlockColors.blackPrimary,
              surface: KBlockColors.blackSurface,
              surfaceVariant: KBlockColors.blackSurface,
              surfaceTint: Colors.white)));

  static KBlockTheme skyBlue = KBlockTheme(
      name: ThemeNames.skyBlue,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.skyBluePrimary,
              secondary: KBlockColors.skyBluePrimary,
              surface: KBlockColors.skyBlueSurface,
              surfaceVariant: KBlockColors.skyBlueSurface,
              surfaceTint: KBlockColors.foregroundColor)));

  static KBlockTheme pink = KBlockTheme(
      name: ThemeNames.pink,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.pinkPrimary,
              secondary: KBlockColors.pinkPrimary,
              surface: KBlockColors.pinkSurface,
              surfaceVariant: KBlockColors.pinkSurface,
              surfaceTint: KBlockColors.foregroundColor)));

  static KBlockTheme green = KBlockTheme(
      name: ThemeNames.green,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.greenPrimary,
              secondary: KBlockColors.greenPrimary,
              surface: KBlockColors.greenSurface,
              surfaceVariant: KBlockColors.greenSurface,
              surfaceTint: KBlockColors.foregroundColor)));

  static KBlockTheme yellow = KBlockTheme(
      name: ThemeNames.yellow,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.yellowPrimary,
              secondary: KBlockColors.yellowPrimary,
              surface: KBlockColors.yellowSurface,
              surfaceVariant: KBlockColors.yellowSurface,
              surfaceTint: KBlockColors.foregroundColor)));

  static KBlockTheme beige = KBlockTheme(
      name: ThemeNames.beige,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.beigePrimary,
              secondary: KBlockColors.beigePrimary,
              surface: KBlockColors.beigeSurface,
              surfaceVariant: KBlockColors.beigeSurface,
              surfaceTint: KBlockColors.foregroundColor)));

  static KBlockTheme gradient = KBlockTheme(
      name: ThemeNames.gradient,
      themeData: _baseThemeData.copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: KBlockColors.gradientPrimary,
              secondary: KBlockColors.gradientSecondary,
              surface: KBlockColors.gradientSurface,
              surfaceVariant: KBlockColors.gradientSurfaceVariant,
              surfaceTint: KBlockColors.foregroundColor)));
}
