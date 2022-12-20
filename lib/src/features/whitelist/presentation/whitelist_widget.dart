import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist.dart';

Widget whitelistWidget(BuildContext context) {
  String whitelistText = AppLocalizations.of(context)?.whitelist != null
        ? AppLocalizations.of(context)!.whitelist
        : 'ホワイトリスト';
  return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text(whitelistText),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      foregroundColor: const Color(0xFF494848),
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
            color: Color(0xFF656565),
          ))
      ],
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () { addWhitelist(context); },
        tooltip: whitelistText,
        backgroundColor: const Color(0xFF14B53D),
        child: const Icon(
          Icons.add_rounded,
          size: 35.0,
        ),
      ),);
}