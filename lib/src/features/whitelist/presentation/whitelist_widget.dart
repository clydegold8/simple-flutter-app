import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist_widget.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import '../data_provider/whitelist_lists_provider.dart';

Widget whitelistWidget(BuildContext context, WidgetRef ref) {
  final listWhitelist = ref.watch(whiteListListProvider).whitelists;
  String whitelistText = AppLocalizations.of(context)?.whitelist ?? 'ホワイトリスト';
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => ref.read(widgetPathProvider.notifier).state = 1,
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      title: Center(
        child: Text(
          whitelistText,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: KBlockColors.foregroundColor),
        ),
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
    body: ListView.builder(
      itemCount: listWhitelist.length,
      itemBuilder: (context, index) {
        return SwitchListTile(
          title: Text(listWhitelist[index].name),
          value: listWhitelist[index].isOn,
          onChanged: (bool value) {
            ref.read(whiteListListProvider.notifier).toggleSwitch(index, value);
          },
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        addWhitelist(context, ref);
      },
      tooltip: whitelistText,
      backgroundColor: KBlockColors.greenThemeColor,
      child: const Icon(
        Icons.add,
        size: 35.0,
      ),
    ),
  );
}
