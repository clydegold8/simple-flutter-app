import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/constants/colors.dart';

import '../../../constants/providers.dart';

Widget adBlockerTabWidget(BuildContext context, WidgetRef ref) {
  final selectedIndex = ref.watch(widgetHomePageTabProvider);
  final tabs = [
    AppLocalizations.of(context)?.tab_24_hours ?? '24時間',
    AppLocalizations.of(context)?.tab_last_day ?? '前日',
    AppLocalizations.of(context)?.tab_1_week ?? '1週間',
    AppLocalizations.of(context)?.tab_1_month ?? '1ヶ月',
    AppLocalizations.of(context)?.tab_6_months ?? '6ヶ月'
  ];

  void onItemTapped(int index) {
    ref.read(widgetHomePageTabProvider.notifier).state = index;
  }

  return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 1))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 31, 20, 0),
              child: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorWeight: 0.1,
                  labelPadding:
                      const EdgeInsets.only(left: 5, right: 5, bottom: 0),
                  tabs: List.generate(
                      tabs.length,
                      (index) => Tab(
                            height: 26,
                            child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: selectedIndex == index
                                            ? [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ]
                                            : [
                                                KBlockColors
                                                    .tabUnselectedBackground,
                                                KBlockColors
                                                    .tabUnselectedBackground
                                              ]),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    tabs[index],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: selectedIndex == index
                                            ? Theme.of(context)
                                                .colorScheme
                                                .inversePrimary
                                            : KBlockColors
                                                .tabUnselectedForeground,
                                        fontWeight: selectedIndex == index
                                            ? FontWeight.w900
                                            : FontWeight.normal),
                                  ),
                                )),
                          )),
                  onTap: onItemTapped,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _adBlockerTabBarViewData(context, '3500', '60MB'),
                  _adBlockerTabBarViewData(context, '4800', '80MB'),
                  _adBlockerTabBarViewData(context, '25000', '80MB'),
                  _adBlockerTabBarViewData(context, '10万', '480MB'),
                  _adBlockerTabBarViewData(context, '60万', '2GB')
                ]),
          ),
        ],
      ));
}

Widget _adBlockerTabBarViewData(
    BuildContext context, String numBlocks, String dataCommSav) {
  final containerDecoration = BoxDecoration(
      color: KBlockColors.lightGray,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1, color: KBlockColors.tabUnselectedBackground),
      boxShadow: const [
        BoxShadow(
            color: KBlockColors.boxShadow, blurRadius: 6, offset: Offset(0, 3))
      ]);
  const dataTextStyle = TextStyle(
      color: KBlockColors.foregroundColor,
      fontSize: 28,
      fontWeight: FontWeight.w800);
  const titleTextStyle =
      TextStyle(color: KBlockColors.foregroundColor, fontSize: 13);

  return Row(children: [
    Expanded(
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 127,
            decoration: containerDecoration,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    numBlocks,
                    style: dataTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    AppLocalizations.of(context)?.num_of_blocks ?? 'ブロック数',
                    style: titleTextStyle,
                  ),
                )
              ],
            )),
      ),
    ),
    Expanded(
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: 127,
            decoration: containerDecoration,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    dataCommSav,
                    style: dataTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    AppLocalizations.of(context)?.data_comm_sav ?? 'データ通信節約量',
                    style: titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
      ),
    )
  ]);
}
