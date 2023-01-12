import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widgets/graphs/line_graph_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import 'history_ads_blocked.dart';

Widget historyCommunicationCostTabWidget(
    BuildContext context, WidgetRef ref, TooltipBehavior tooltipBehavior) {
  final selectedIndex = ref.watch(widgetCommunicationCostTabProvider);
  final tabs = [
    AppLocalizations.of(context)?.tab_24_hours ?? '24時間',
    AppLocalizations.of(context)?.tab_last_day ?? '前日',
    AppLocalizations.of(context)?.tab_1_week ?? '1週間',
    AppLocalizations.of(context)?.tab_1_month ?? '1ヶ月',
    AppLocalizations.of(context)?.tab_6_months ?? '6ヶ月'
  ];

  // TODO: this will be replaced with actual data
  List<GraphData> data = [
    GraphData('12:00', Random().nextInt(100).toDouble()),
    GraphData('1:50', Random().nextInt(100).toDouble()),
    GraphData('2:00', Random().nextInt(100).toDouble()),
    GraphData('3:00', Random().nextInt(100).toDouble()),
    GraphData('4:50', Random().nextInt(100).toDouble())
  ];

  void onItemTapped(int index) {
    ref.read(widgetCommunicationCostTabProvider.notifier).state = index;
  }

  return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: KBlockColors.lightGray),
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
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  lineGraphWidget(context, tooltipBehavior, data,
                      '60MB / 1分30秒', '24時間'), // 24hrs
                  lineGraphWidget(context, tooltipBehavior, data,
                      '80MB / 3分05秒', '前日'), // last day
                  lineGraphWidget(context, tooltipBehavior, data,
                      '120MB / 6分30秒', '1週間'), // 1 week
                  lineGraphWidget(context, tooltipBehavior, data,
                      '480MB / 23分00秒', '1ヶ月'), // 1 month
                  lineGraphWidget(context, tooltipBehavior, data,
                      '5GB / 2時間30分', '6ヶ月'), // six months
                ]),
          ),
        ],
      ));
}
