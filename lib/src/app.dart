import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/routing/router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookLocales()
final locales = <Locale>[
  const Locale('en'),
  const Locale('ja'),
];
@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => ThemeData(
      primarySwatch: Colors.blue,
    );

@WidgetbookApp.material(name: 'K-Block App')
class KBlockApp extends StatelessWidget {
  const KBlockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NunitoSans'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.loginRoute,
    );
  }
}
