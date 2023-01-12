import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist_widget.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import '../data_provider/whitelist_lists_provider.dart';

Widget whitelistWidget(BuildContext context, WidgetRef ref) {
  final listWhitelist = ref.watch(whiteListListProvider).whitelists;
  final onDeleteMode = ref.watch(whiteListDeleteMode);
  String whitelistText = AppLocalizations.of(context)?.whitelist ?? 'ホワイトリスト';
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => {
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ref.read(widgetPathProvider.notifier).state = 1,
                ref.read(whiteListDeleteMode.notifier).state = false
              },
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      title: Text(
        whitelistText,
        style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: KBlockColors.foregroundColor),
      ),
      centerTitle: true,
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Delete Whitelist',
          onPressed: () {
            ref.read(whiteListDeleteMode.notifier).state = true;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(hours: 1),
              // this is to imitate duration before the snackbar disappear without user interaction
              content: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ref.read(whiteListDeleteMode.notifier).state = false;
                      ref
                          .read(whiteListListProvider.notifier)
                          .deleteWhiteLists();
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: KBlockColors.white,
                        side: const BorderSide(color: KBlockColors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    child: SizedBox(
                      height: 40.0,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                          child: SizedBox(
                              child: Text(
                                  AppLocalizations.of(context)?.delete ?? '削除',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: KBlockColors.text02,
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)))),
                    ),
                  )
                ],
              ),
            ));
          },
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: listWhitelist.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: onDeleteMode
              ? Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    activeColor: KBlockColors.greenThemeColor,
                    value: listWhitelist[index].isSelected,
                    onChanged: (value) {
                      ref
                          .read(whiteListListProvider.notifier)
                          .toggleCheckbox(index, value!);
                    },
                  ),
                )
              : null,
          title: Text(listWhitelist[index].name),
          trailing: Switch(
            activeColor: KBlockColors.greenThemeColor,
            value: listWhitelist[index].isOn,
            onChanged: (bool value) {
              ref
                  .read(whiteListListProvider.notifier)
                  .toggleSwitch(index, value);
            },
          ),
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
