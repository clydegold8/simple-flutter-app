import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/constants/providers.dart';
import 'package:k_block_app/src/routing/router.dart';

@WidgetbookLocalizationDelegates()
const localizationsDelegates = AppLocalizations.localizationsDelegates;

@WidgetbookLocales()
const locales = AppLocalizations.supportedLocales;

@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => ThemeData(
      primarySwatch: Colors.blue,
    );

@WidgetbookApp.material(name: 'K-Block App')
class KBlockApp extends ConsumerWidget {
  const KBlockApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(activeThemeProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.loginRoute,
    );
  }
}
