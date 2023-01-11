import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/common_widgets/switch.dart';
import 'package:k_block_app/src/features/app_management_list/data_provider/app_setting_provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget appManagementListWidget(BuildContext context, WidgetRef ref) {
  final appItemsList = ref.watch(appSettingItemProvider).appItems;
  String appManagementText =
      AppLocalizations.of(context)?.app_management ?? 'アプリ管理';

  onPressItem(index, value) {
    ref.read(appSettingItemProvider.notifier).toggleSwitch(index, value);
  }

  onPressAllButton(newSwitchValue) {
    ref.read(appSettingItemProvider.notifier).toggleAllSwitches(newSwitchValue);
  }

  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => ref.read(widgetPathProvider.notifier).state = 1,
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      title: Text(
        appManagementText,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      centerTitle: true,
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      actions: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: KBlockColors.divider,
            ),
          ),
          child: PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              position: PopupMenuPosition.under,
              offset: const Offset(0, 9),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    height: 40,
                    child: SizedBox(
                      width: 90,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                        child: const Text(
                          'すべてON',
                          style: TextStyle(
                            color: KBlockColors.foregroundColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const PopupMenuDivider(
                    height: 0.5,
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    height: 40,
                    child: SizedBox(
                      width: 90,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: const Text(
                          'すべてOFF',
                          style: TextStyle(
                            color: KBlockColors.foregroundColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  onPressAllButton(true);
                } else if (value == 1) {
                  onPressAllButton(false);
                }
              }),
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: appItemsList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            ref.read(selectedAppIndexProvider.notifier).state = index;
            ref.read(widgetPathProvider.notifier).state = 7;
          },
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                color: KBlockColors.white,
                border: Border(
                    bottom:
                        BorderSide(width: 0.5, color: KBlockColors.divider))),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                appItemsList[index].imgUrl,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  appItemsList[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: KBlockColors.text02),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  appItemsList[index].dataUsage,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: KBlockColors.text02),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: SwitchWidget(
                        switchValue: appItemsList[index].isOn,
                        index: index,
                        updateValue: onPressItem,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
