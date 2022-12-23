import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist_widget.dart';

import '../../../constants/colors.dart';

Widget whitelistWidget(BuildContext context) {
  String whitelistText = AppLocalizations.of(context)?.whitelist != null
        ? AppLocalizations.of(context)!.whitelist
        : 'ホワイトリスト';
  return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text(
          whitelistText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show Snackbar',
          onPressed: () {},
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
        onPressed: () { addWhitelist(context); },
        tooltip: whitelistText,
        backgroundColor: KBlockColors.greenThemeColor,
        child: const Icon(Icons.add, size: 35.0,),
      ),);
}