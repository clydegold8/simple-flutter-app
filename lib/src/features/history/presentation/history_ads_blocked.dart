import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widgets/graphs/line_graph_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget historyAdsBlockedTabWidget(
    BuildContext context,
    WidgetRef ref,
    TooltipBehavior tooltipBehavior,
    TooltipBehavior tooltipBehaviorWeekMonthAdsBlocked) {
  final selectedIndex = ref.watch(widgetAdsBlockedTabProvider);
  final tabs = [
    AppLocalizations.of(context)?.tab_24_hours ?? '24時間',
    AppLocalizations.of(context)?.tab_last_day ?? '前日',
    AppLocalizations.of(context)?.tab_1_week ?? '1週間',
    AppLocalizations.of(context)?.tab_1_month ?? '1ヶ月',
    AppLocalizations.of(context)?.tab_6_months ?? '6ヶ月'
  ];

  // TODO: this will be replaced with actual data
  List<GraphData> data = [
    GraphData('0:00', Random().nextInt(100).toDouble(), '10/1 (土)'),
    GraphData('0:50', Random().nextInt(100).toDouble(), '9/30 (土）'),
    GraphData('1:00', Random().nextInt(100).toDouble(), '10/1 (土）'),
    GraphData('1:50', Random().nextInt(100).toDouble(), '10/1 (土）'),
    GraphData('2:00', Random().nextInt(100).toDouble(), '10/1 (土）')
  ];

  List<GraphData> dataTwo = [
    GraphData('0:00', Random().nextInt(100).toDouble(), '10/1 (金)'),
    GraphData('0:50', Random().nextInt(100).toDouble(), '9/30 (金）'),
    GraphData('1:00', Random().nextInt(100).toDouble(), '10/1 (金）'),
    GraphData('1:50', Random().nextInt(100).toDouble(), '10/1 (金）'),
    GraphData('2:00', Random().nextInt(100).toDouble(), '10/1 (金）')
  ];

  List<GraphData> dataThree = [
    GraphData('0:00', Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData('0:50', Random().nextInt(100).toDouble(), '9/30 (木）'),
    GraphData('1:00', Random().nextInt(100).toDouble(), '10/1 (木）'),
    GraphData('1:50', Random().nextInt(100).toDouble(), '10/1 (木）'),
    GraphData('2:00', Random().nextInt(100).toDouble(), '10/1 (木）')
  ];

  void onItemTapped(int index) {
    ref.read(widgetAdsBlockedTabProvider.notifier).state = index;
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
                  lineGraphWidget(
                      context, tooltipBehavior, data, '3500件', '24時間'), // 24hrs
                  lineGraphWidget(context, tooltipBehavior, dataTwo, '4800件',
                      '前日'), // last day
                  lineGraphWidget(context, tooltipBehaviorWeekMonthAdsBlocked,
                      dataThree, '25000件', '1週間'), // 1 week
                  lineGraphWidget(context, tooltipBehaviorWeekMonthAdsBlocked,
                      dataThree, '10万件', '1ヶ月'), // 1 month
                  lineGraphWidget(context, tooltipBehaviorWeekMonthAdsBlocked,
                      dataThree, '60万件', '6ヶ月'), // six months
                ]),
          ),
        ],
      ));
}

// TODO: this will be refactored later for backend use modeling
class GraphData {
  GraphData(this.time, this.consumedData, this.tooltipHeader);

  final String time;
  final double consumedData;
  final String tooltipHeader;
}
