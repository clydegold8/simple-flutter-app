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
  final onDeleteMode = ref.watch(blackListDeleteMode);
  Color getColor(Set<MaterialState> states) {
    return KBlockColors.activeSwitch;
  }

  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => {
                ref.read(widgetPathProvider.notifier).state = 1,
                ref.read(blackListDeleteMode.notifier).state = false,
                ScaffoldMessenger.of(context).hideCurrentSnackBar()
              },
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      title: Text(AppLocalizations.of(context)?.blacklist ?? 'ブラックリスト',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Delete Blacklist',
          onPressed: () {
            ref.read(blackListDeleteMode.notifier).state = true;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(hours: 1),
              // this is to imitate duration before the snackbar disappear without user interaction
              content: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ref.read(blackListDeleteMode.notifier).state = false;
                      ref.read(blackListProvider.notifier).deleteBlackLists();
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
      itemCount: listBlacklist.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: onDeleteMode
              ? Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    activeColor: KBlockColors.activeSwitch,
                    value: listBlacklist[index].isSelected,
                    onChanged: (value) {
                      ref
                          .read(blackListProvider.notifier)
                          .toggleCheckbox(index, value!);
                    },
                  ),
                )
              : null,
          title: Text(listBlacklist[index].name),
          trailing: Switch(
            activeColor: KBlockColors.activeSwitch,
            value: listBlacklist[index].isOn,
            onChanged: (bool value) {
              ref.read(blackListProvider.notifier).toggleSwitch(index, value);
            },
          ),
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
