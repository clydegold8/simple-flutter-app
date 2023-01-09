import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import '../../add_blacklist/presentation/add_blacklist_widget.dart';
import '../data_provider/blacklist_list_provider.dart';

@override
Widget blackListWidget(BuildContext context, WidgetRef ref) {
  final listBlacklist = ref.watch(blackListProvider).blacklists;
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => ref.read(widgetPathProvider.notifier).state = 1,
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
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
    body:ListView.builder(
      itemCount: listBlacklist.length,
      itemBuilder: (context, index) {
        return SwitchListTile(
          activeColor: KBlockColors.greenThemeColor,
          title: Text(listBlacklist[index].name),
          value: listBlacklist[index].isOn,
          onChanged: (bool value) {
            ref.read(blackListProvider.notifier).toggleSwitch(index, value);
          },
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: KBlockColors.greenThemeColor,
      onPressed: () {
        addBlacklist(context, ref);
      },
      child: const Icon(Icons.add, size: 30.0),
    ),
  );
}
