import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/common_widgets/switch.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget appManagementListWidget(BuildContext context, WidgetRef ref) {
  String appManagementText =
      AppLocalizations.of(context)?.app_management ?? 'アプリ管理';
  final List<String> appNames = <String>[
    'グルメサイトアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ',
    'ショッピングアプリ'
  ];
  final List<String> appIconUrl = <String>[
    'assets/images/app_sample_1.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
    'assets/images/app_sample_2.png',
  ];
  final List<int> appDataUsage = <int>[
    40,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
  ];

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
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show Snackbar',
          onPressed: () {},
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: appNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
                                style:
                                    const TextStyle(color: KBlockColors.text02),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '${appDataUsage[index]}mb',
                                style:
                                    const TextStyle(color: KBlockColors.text02),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const Expanded(flex: 1, child: SwitchWidget()),
              ],
            ),
          ),
        );
      },
    ),
  );
}
