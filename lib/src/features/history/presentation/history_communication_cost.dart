import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widgets/graphs/line_graph_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import 'history_ads_blocked.dart';
import 'history_six_months_tabs.dart';

Widget historyCommunicationCostTabWidget(
    BuildContext context,
    WidgetRef ref,
    TooltipBehavior tooltipBehavior,
    TooltipBehavior tooltipBehaviorWeekMonthCommunicationsCost,
    ZoomPanBehavior zoomPanBehavior) {
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
    GraphData(
        DateTime(2022, 10, 1, 0), Random().nextInt(100).toDouble(), '10/1 (土)'),
    GraphData(
        DateTime(2022, 10, 1, 1), Random().nextInt(100).toDouble(), '10/2 (土)'),
    GraphData(
        DateTime(2022, 10, 1, 2), Random().nextInt(100).toDouble(), '10/3 (土)'),
    GraphData(
        DateTime(2022, 10, 1, 3), Random().nextInt(100).toDouble(), '10/4 (土)'),
    GraphData(
        DateTime(2022, 10, 1, 4), Random().nextInt(100).toDouble(), '10/5 (土)'),
    GraphData(
        DateTime(2022, 10, 1, 5), Random().nextInt(100).toDouble(), '10/5 (土)'),
    GraphData(
        DateTime(2022, 10, 1, 6), Random().nextInt(100).toDouble(), '10/5 (土)'),
  ];

  List<GraphData> dataTwo = [
    GraphData(
        DateTime(2022, 10, 2, 0), Random().nextInt(100).toDouble(), '10/1 (金)'),
    GraphData(
        DateTime(2022, 10, 2, 1), Random().nextInt(100).toDouble(), '10/2 (金)'),
    GraphData(
        DateTime(2022, 10, 2, 2), Random().nextInt(100).toDouble(), '10/3 (金)'),
    GraphData(
        DateTime(2022, 10, 2, 3), Random().nextInt(100).toDouble(), '10/4 (金)'),
    GraphData(
        DateTime(2022, 10, 2, 4), Random().nextInt(100).toDouble(), '10/5 (金)'),
    GraphData(
        DateTime(2022, 10, 2, 5), Random().nextInt(100).toDouble(), '10/6 (金)'),
    GraphData(
        DateTime(2022, 10, 2, 6), Random().nextInt(100).toDouble(), '10/7 (金)')
  ];

  List<GraphData> dataThree = [
    GraphData(
        DateTime(2022, 10, 1, 0), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 2, 1), Random().nextInt(100).toDouble(), '10/2 (木)'),
    GraphData(
        DateTime(2022, 10, 3, 3), Random().nextInt(100).toDouble(), '10/3 (木)'),
    GraphData(
        DateTime(2022, 10, 4, 4), Random().nextInt(100).toDouble(), '10/4 (木)'),
    GraphData(
        DateTime(2022, 10, 5, 5), Random().nextInt(100).toDouble(), '10/5 (木)'),
    GraphData(
        DateTime(2022, 10, 6, 6), Random().nextInt(100).toDouble(), '10/6 (木)'),
    GraphData(
        DateTime(2022, 10, 7, 7), Random().nextInt(100).toDouble(), '10/7 (木)'),
  ];

  List<GraphData> dataFour = [
    GraphData(
        DateTime(2022, 10, 1, 0), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 2, 1), Random().nextInt(100).toDouble(), '9/30 (木)'),
    GraphData(
        DateTime(2022, 10, 3, 3), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 4, 4), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 5, 5), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 6, 6), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 7, 7), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 8, 8), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(
        DateTime(2022, 10, 9, 9), Random().nextInt(100).toDouble(), '10/1 (木)'),
    GraphData(DateTime(2022, 10, 10, 10), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 11, 11), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 12, 12), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 13, 1), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 14, 2), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 15, 3), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 16, 4), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 17, 5), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 18, 6), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 19, 7), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 20, 8), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 21, 9), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 22, 10), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 23, 11), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 24, 12), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 25, 1), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 26, 2), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 27, 3), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 28, 4), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 29, 5), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
    GraphData(DateTime(2022, 10, 30, 6), Random().nextInt(100).toDouble(),
        '10/1 (木)'),
  ];

  void onItemTapped(int index) {
    ref.read(widgetCommunicationCostTabProvider.notifier).state = index;
    ref.read(widgetSixMonthsTabProvider.notifier).state = 0;
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
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
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
                      context,
                      tooltipBehavior,
                      data,
                      '60MB / 1${AppLocalizations.of(context)?.min ?? '分'}30${AppLocalizations.of(context)?.sec ?? '秒'}',
                      '24時間',
                      true,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.HOUR24_MINUTE),
                      DateTimeIntervalType.hours,
                      '十月',
                      false), // 24hrs
                  lineGraphWidget(
                      context,
                      tooltipBehavior,
                      dataTwo,
                      '80MB / 3${AppLocalizations.of(context)?.min ?? '分'}05${AppLocalizations.of(context)?.sec ?? '秒'}',
                      '前日',
                      true,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.HOUR24_MINUTE),
                      DateTimeIntervalType.hours,
                      '十月',
                      false), // last day
                  lineGraphWidget(
                      context,
                      tooltipBehaviorWeekMonthCommunicationsCost,
                      dataThree,
                      '120MB / 6${AppLocalizations.of(context)?.min ?? '分'}05${AppLocalizations.of(context)?.sec ?? '秒'}',
                      '1週間',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      '十月',
                      true), // 1 week
                  lineGraphWidget(
                      context,
                      tooltipBehaviorWeekMonthCommunicationsCost,
                      dataFour,
                      '480MB / 23${AppLocalizations.of(context)?.min ?? '分'}00${AppLocalizations.of(context)?.sec ?? '秒'}',
                      '1ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      '十月',
                      true), // 1 month
                  historySixMonthsTabWidget(
                      context,
                      ref,
                      tooltipBehaviorWeekMonthCommunicationsCost,
                      zoomPanBehavior,
                      false), // six months
                ]),
          ),
        ],
      ));
}
