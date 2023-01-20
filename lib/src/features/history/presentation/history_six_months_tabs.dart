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

Widget historySixMonthsTabWidget(
    BuildContext context,
    WidgetRef ref,
    TooltipBehavior tooltipBehaviorSixMonths,
    ZoomPanBehavior zoomPanBehavior,
    bool isFirstTab) {
  final selectedIndex = ref.watch(widgetSixMonthsTabProvider);
  final tabs = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN'];

  // TODO: this will be replaced with actual data
  List tabTitles = [
    '5GB / 2${AppLocalizations.of(context)?.hours ?? '時間'}30${AppLocalizations.of(context)?.min ?? '分'}',
    '6GB / 2${AppLocalizations.of(context)?.hours ?? '時間'}30${AppLocalizations.of(context)?.min ?? '分'}',
    '7GB / 2${AppLocalizations.of(context)?.hours ?? '時間'}30${AppLocalizations.of(context)?.min ?? '分'}',
    '8GB / 2${AppLocalizations.of(context)?.hours ?? '時間'}30${AppLocalizations.of(context)?.min ?? '分'}',
    '9GB / 2${AppLocalizations.of(context)?.hours ?? '時間'}30${AppLocalizations.of(context)?.min ?? '分'}',
    '10GB / 2${AppLocalizations.of(context)?.hours ?? '時間'}30${AppLocalizations.of(context)?.min ?? '分'}',
  ];

  List tabTitlesTwo = [
    '10${AppLocalizations.of(context)?.pieces ?? '万件'}',
    '20${AppLocalizations.of(context)?.pieces ?? '万件'}',
    '30${AppLocalizations.of(context)?.pieces ?? '万件'}',
    '40${AppLocalizations.of(context)?.pieces ?? '万件'}',
    '50${AppLocalizations.of(context)?.pieces ?? '万件'}',
    '60${AppLocalizations.of(context)?.pieces ?? '万件'}',
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
    ref.read(widgetSixMonthsTabProvider.notifier).state = index;
  }

  return DefaultTabController(
      length: 6,
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
                      context,
                      tooltipBehaviorSixMonths,
                      dataFour,
                      isFirstTab ? tabTitlesTwo[0] : tabTitles[0],
                      '6ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      tabs[0],
                      true),
                  lineGraphWidget(
                      context,
                      tooltipBehaviorSixMonths,
                      dataFour,
                      isFirstTab ? tabTitlesTwo[1] : tabTitles[1],
                      '6ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      tabs[1],
                      true),
                  lineGraphWidget(
                      context,
                      tooltipBehaviorSixMonths,
                      dataFour,
                      isFirstTab ? tabTitlesTwo[2] : tabTitles[2],
                      '6ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      tabs[2],
                      true),
                  lineGraphWidget(
                      context,
                      tooltipBehaviorSixMonths,
                      dataFour,
                      isFirstTab ? tabTitlesTwo[3] : tabTitles[3],
                      '6ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      tabs[3],
                      true),
                  lineGraphWidget(
                      context,
                      tooltipBehaviorSixMonths,
                      dataFour,
                      isFirstTab ? tabTitlesTwo[4] : tabTitles[4],
                      '6ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      tabs[4],
                      true),
                  lineGraphWidget(
                      context,
                      tooltipBehaviorSixMonths,
                      dataFour,
                      isFirstTab ? tabTitlesTwo[5] : tabTitles[5],
                      '6ヶ月',
                      false,
                      zoomPanBehavior,
                      null,
                      DateFormat(DateFormat.DAY),
                      DateTimeIntervalType.days,
                      tabs[5],
                      true), // six months
                ]),
          ),
        ],
      ));
}
