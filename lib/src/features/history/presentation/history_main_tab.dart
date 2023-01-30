import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import 'history_ads_blocked.dart';
import 'history_communication_cost.dart';

Widget historyMainTabWidget(
    BuildContext context,
    WidgetRef ref,
    TooltipBehavior tooltipBehaviorAdsBlocked,
    TooltipBehavior tooltipBehaviorCommunicationCost,
    TooltipBehavior tooltipBehaviorWeekMonthAdsBlocked,
    TooltipBehavior tooltipBehaviorWeekMonthCommunicationsCost,
    ZoomPanBehavior zoomPanBehavior) {
  final selectedIndex = ref.watch(widgetHistoryMainTabProvider);

  void onTabTapped(int index) {
    ref.read(widgetHistoryMainTabProvider.notifier).state = index;
    Future.delayed(const Duration(milliseconds: 350), () async {
      ref.read(widgetAdsBlockedTabProvider.notifier).state = 0;
      ref.read(widgetCommunicationCostTabProvider.notifier).state = 0;
      ref.read(widgetSixMonthsTabProvider.notifier).state = 0;
    });
  }

  return MaterialApp(
    home: DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: KBlockColors.white,
            title: Center(
              child: Text(
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: KBlockColors.foregroundColor),
                  AppLocalizations.of(context)?.history ?? '履歴'),
            ),
          ),
          body: Column(
            children: [
              Container(
                color: KBlockColors.lightGray,
                child: Theme(
                  data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent),
                  child: TabBar(
                    indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 2, color: KBlockColors.greenThemeColor),
                        ),
                        color: KBlockColors.white),
                    onTap: onTabTapped,
                    unselectedLabelColor: KBlockColors.grayThemeColor,
                    labelColor: KBlockColors.greenThemeColor,
                    indicatorColor: KBlockColors.greenThemeColor,
                    labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: KBlockColors.foregroundColor),
                    tabs: [
                      // Tab(text: AppLocalizations.of(context)?.number_of_ads_blocked ?? '広告ブロック数'),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? KBlockColors.white
                                  : KBlockColors.lightGray),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)
                                      ?.number_of_ads_blocked ??
                                  '広告ブロック数',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selectedIndex == 0
                                      ? KBlockColors.greenThemeColor
                                      : KBlockColors.tabUnselectedForeground,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? KBlockColors.white
                                  : KBlockColors.lightGray),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)
                                      ?.communication_cost_savings_hour ??
                                  '節約通信料 / 時間',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selectedIndex == 1
                                      ? KBlockColors.greenThemeColor
                                      : KBlockColors.tabUnselectedForeground,
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                      // Tab(
                      //     text: AppLocalizations.of(context)
                      //             ?.communication_cost_savings_hour ??
                      //         '節約通信料 / 時間'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    historyAdsBlockedTabWidget(
                        context,
                        ref,
                        tooltipBehaviorAdsBlocked,
                        tooltipBehaviorWeekMonthAdsBlocked,
                        zoomPanBehavior),
                    historyCommunicationCostTabWidget(
                        context,
                        ref,
                        tooltipBehaviorCommunicationCost,
                        tooltipBehaviorWeekMonthCommunicationsCost,
                        zoomPanBehavior),
                  ],
                ),
              ),
            ],
          )),
    ),
  );
}
