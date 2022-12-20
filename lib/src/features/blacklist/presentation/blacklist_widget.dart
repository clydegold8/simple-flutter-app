import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@override
Widget blackListWidget(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      title: Center(
          child: Text(AppLocalizations.of(context)?.blacklist != null
              ? AppLocalizations.of(context)!.blacklist
              : 'ブラックリスト')),
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    ),
    body: Column(
      children: const [
        Text('ブラックリスト',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KBlockColors.text01,
            ))
      ],
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: KBlockColors.greenThemeColor,
      onPressed: () {},
      child: const Icon(Icons.add, size: 30.0),
    ),
  );
}