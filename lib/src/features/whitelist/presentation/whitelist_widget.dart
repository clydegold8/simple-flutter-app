import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/colors.dart';

Widget whitelistWidget(BuildContext context) {
  String whitelistText = AppLocalizations.of(context)?.whitelist != null
        ? AppLocalizations.of(context)!.whitelist
        : 'ホワイトリスト';
  return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text(whitelistText),
      ),
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    ),
    body: Column(
      children: [
        Text(whitelistText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: KBlockColors.text01,
          ))
      ],
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: whitelistText,
        backgroundColor: KBlockColors.greenThemeColor,
        child: const Icon(Icons.add),
      ),);
}