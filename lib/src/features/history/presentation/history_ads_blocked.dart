import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget historyAdsBlockedTabWidget(BuildContext context, WidgetRef ref) {
  final selectedIndex = ref.watch(widgetAdsBlockedTabProvider);
  final tabs = [
    AppLocalizations.of(context)?.tab_24_hours ?? '24時間',
    AppLocalizations.of(context)?.tab_last_day ?? '前日',
    AppLocalizations.of(context)?.tab_1_week ?? '1週間',
    AppLocalizations.of(context)?.tab_1_month ?? '1ヶ月',
    AppLocalizations.of(context)?.tab_6_months ?? '6ヶ月'
  ];

  void onItemTapped(int index) {
    print(index);
    ref.read(widgetAdsBlockedTabProvider.notifier).state = index;
  }

  return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: KBlockColors.lightGray),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 31, 20, 0),
              child: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                child: TabBar(
                  indicatorColor: Colors.transparent,
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
                                    color: selectedIndex == index
                                        ? KBlockColors.white
                                        : KBlockColors.tabUnselectedBackground,
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
                                            ? KBlockColors.greenThemeColor
                                            : KBlockColors
                                                .tabUnselectedForeground,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          )),
                  onTap: onItemTapped,
                ),
              ),
            ),
          ),
          const Expanded(
            child:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              Text('One'),
              Text('Two'),
              Text('Three'),
              Text('Four'),
              Text('Five'),
            ]),
          ),
        ],
      ));
}
