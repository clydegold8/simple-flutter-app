import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';
import 'history_ads_blocked.dart';
import 'history_communication_cost.dart';

Widget historyMainTabWidget(
    BuildContext context, WidgetRef ref, TooltipBehavior tooltipBehaviorAdsBlocked, TooltipBehavior tooltipBehaviorCommunicationCost) {
  void onTabTapped(int index) {
    ref.read(widgetAdsBlockedTabProvider.notifier).state = 0;
    ref.read(widgetCommunicationCostTabProvider.notifier).state = 0;
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: TabBar(
                      onTap: onTabTapped,
                      unselectedLabelColor: KBlockColors.grayThemeColor,
                      labelColor: KBlockColors.greenThemeColor,
                      indicatorColor: KBlockColors.greenThemeColor,
                      labelStyle:  const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: KBlockColors.foregroundColor),
                      tabs: [
                        Tab(text: AppLocalizations.of(context)?.number_of_ads_blocked ?? '広告ブロック数'),
                        Tab(text: AppLocalizations.of(context)?.communication_cost_savings_hour ?? '節約通信料 / 時間'),
                      ],
                    ),
                  ),
                ),
              ),
               Expanded(
                child: TabBarView(
                  children: [
                    historyAdsBlockedTabWidget(context, ref, tooltipBehaviorAdsBlocked),
                    historyCommunicationCostTabWidget(
                        context, ref, tooltipBehaviorCommunicationCost),
                  ],
                ),
              ),
            ],
          )),
    ),
  );
}
