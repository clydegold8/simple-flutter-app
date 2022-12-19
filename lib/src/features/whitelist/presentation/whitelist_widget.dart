import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget whitelistWidget(BuildContext context) {
  String whitelistText = AppLocalizations.of(context)?.whitelist != null
        ? AppLocalizations.of(context)!.whitelist
        : 'ホワイトリスト';
  return Scaffold(
    backgroundColor: const Color(0xFFFFFFFF),
    appBar: AppBar(
      title: Text(whitelistText),
    ),
    body: Column(
      children: [
        Text(whitelistText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF656565),
          ))
      ],
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: whitelistText,
        child: const Icon(Icons.add),
      ),);
}