import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

@override
Widget blackListWidget(BuildContext context, WidgetRef ref) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => ref.read(widgetPathProvider.notifier).state = 1,
          icon: const Icon(Icons.arrow_back_ios, size: 30)),
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      title: Center(
          child: Text(AppLocalizations.of(context)?.blacklist ?? 'ブラックリスト',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
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
