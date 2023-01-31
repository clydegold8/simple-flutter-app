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
  final isDeleteSnackBarShown = ref.watch(blackListDeleteSnackBarShownProvider);
  Color getColor(Set<MaterialState> states) {
    return Theme.of(context).colorScheme.primary;
  }

  void showDeleteSnackBar() {
    ref.read(blackListDeleteSnackBarShownProvider.notifier).state = true;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.fromLTRB(15, 18, 0, 18),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
      duration: const Duration(hours: 1),
      // this is to imitate duration before the snackbar disappear without user interaction
      content: Row(
        children: [
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ref.read(blackListDeleteMode.notifier).state = false;
              ref.read(blackListDeleteSnackBarShownProvider.notifier).state =
                  false;
              ref.read(blackListProvider.notifier).deleteBlackLists();
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                side: BorderSide(
                    color: Theme.of(context).colorScheme.errorContainer),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
            child: SizedBox(
              height: 40.0,
              width: 55.0,
              child: Center(
                  child: Text(AppLocalizations.of(context)?.delete ?? '削除',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 16,
                          fontWeight: FontWeight.w400))),
            ),
          )
        ],
      ),
    ));
  }

  return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ref.read(widgetPathProvider.notifier).state = 1;
        ref.read(blackListDeleteMode.notifier).state = false;
        ref.read(blackListDeleteSnackBarShownProvider.notifier).state = false;
        return false;
      },
      child: Scaffold(
        backgroundColor: KBlockColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => {
                    ref.read(widgetPathProvider.notifier).state = 1,
                    ref.read(blackListDeleteMode.notifier).state = false,
                    ref
                        .read(blackListDeleteSnackBarShownProvider.notifier)
                        .state = false,
                    ScaffoldMessenger.of(context).hideCurrentSnackBar()
                  },
              icon: const Icon(Icons.arrow_back_ios, size: 25)),
          backgroundColor: KBlockColors.white,
          foregroundColor: KBlockColors.foregroundColor,
          title: Text(AppLocalizations.of(context)?.blacklist ?? 'ブラックリスト',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'Delete Blacklist',
              onPressed: () {
                ref.read(blackListDeleteMode.notifier).state = true;
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              padding: onDeleteMode
                  ? const EdgeInsets.only(bottom: 80)
                  : const EdgeInsets.only(bottom: 0),
              itemCount: listBlacklist.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      color: KBlockColors.white,
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: KBlockColors.divider))),
                  child: ListTile(
                    leading: onDeleteMode
                        ? Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              value: listBlacklist[index].isSelected,
                              onChanged: (value) {
                                ref
                                    .read(blackListProvider.notifier)
                                    .toggleCheckbox(index, value!);

                                final selectedBlacklistIsEmpty = listBlacklist
                                    .where(
                                        (element) => element.isSelected == true)
                                    .toList()
                                    .isEmpty;
                                if (selectedBlacklistIsEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ref
                                      .read(blackListDeleteSnackBarShownProvider
                                          .notifier)
                                      .state = false;
                                } else if (!selectedBlacklistIsEmpty &&
                                    !isDeleteSnackBarShown) {
                                  showDeleteSnackBar();
                                }
                              },
                            ),
                          )
                        : null,
                    title: Text(listBlacklist[index].name),
                    trailing: Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: listBlacklist[index].isOn,
                      onChanged: (bool value) {
                        ref
                            .read(blackListProvider.notifier)
                            .toggleSwitch(index, value);
                      },
                    ),
                  ),
                );
              },
            )),
            Container(
              height: onDeleteMode ? 0 : 83,
              color: KBlockColors.white,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            addBlacklist(context, ref);
          },
          child: const Icon(Icons.add, size: 30.0),
        ),
      ));
}
