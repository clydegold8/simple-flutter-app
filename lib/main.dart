import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/widgets/login_form.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'NunitoSans'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Scaffold(
        backgroundColor: Color(0xFFEAEAEA),
        body: KBlockLoginForm(),
      )));
}
