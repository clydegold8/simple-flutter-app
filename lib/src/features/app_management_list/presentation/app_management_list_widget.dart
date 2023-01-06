import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/common_widgets/switch.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget appManagementListWidget(BuildContext context, WidgetRef ref) {
  String appManagementText =
      AppLocalizations.of(context)?.app_management ?? 'アプリ管理';
  final statusList = ref.watch(appAdStatusProvider);
  final List<String> appNames = <String>[
    'グルメサイトアプリ',
    'ショッピングアプリ',
    'ショップアプリ',
    '家計＿アプリ',
    'レシピサイトアプリ',
    'メモアプリ',
    'ポイントサイトアプリ',
    'チャットアプリ',
    '音楽アプリ',
    'カメラアプリ',
    'アプリ',
  ];
  final List<String> appIconUrl = <String>[
    'assets/images/app_sample_1.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_3.png',
    'assets/images/app_sample_4.png',
    'assets/images/app_sample_5.png',
    'assets/images/app_sample_6.png',
    'assets/images/app_sample_7.png',
    'assets/images/app_sample_8.png',
    'assets/images/app_sample_9.png',
    'assets/images/app_sample_10.png',
    'assets/images/app_sample_11.png',
  ];
  final List<String> appDataUsage = <String>[
    '80MB',
    '70MB',
    '60MB',
    '50MB',
    '40MB',
    '30MB',
    '20MB',
    '10MB',
    '5MB',
    '2MB',
    '200KB',
  ];
  onPressItem(index, value) {
    var oldState = ref.read(appAdStatusProvider);
    oldState[index] = value;
    ref.read(appAdStatusProvider.notifier).state = [...oldState];
  }

  onPressAllButton(newSwitchValue) {
    var oldState = ref.read(appAdStatusProvider);
    for (var i = 0; i < oldState.length; i++) {
      oldState[i] = newSwitchValue;
    }
    ref.read(appAdStatusProvider.notifier).state = [...oldState];
  }

  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => ref.read(widgetPathProvider.notifier).state = 1,
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      title: Center(
        child: Text(
          appManagementText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      actions: <Widget>[
        PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('すべてON'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('すべてOFF'),
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
      ],
    ),
    body: ListView.builder(
      itemCount: appNames.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Text('${appNames[index]} Management Screen')),
            );
          },
          child: Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: KBlockColors.borderLightGray))),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                appIconUrl[index],
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  appNames[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: KBlockColors.text02),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  appDataUsage[index],
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
                        switchValue: statusList[index],
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
