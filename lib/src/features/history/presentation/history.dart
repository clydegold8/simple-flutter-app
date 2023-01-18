import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../constants/colors.dart';
import 'history_main_tab.dart';

@WidgetbookUseCase(name: 'HistoryPage', type: History)
Widget historyUseCase(BuildContext context) => const History();

class History extends ConsumerStatefulWidget {
  const History({super.key});

  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends ConsumerState<History> {
  late TooltipBehavior _tooltipBehaviorAdsBlocked;
  late TooltipBehavior _tooltipBehaviorCommunicationCost;
  late TooltipBehavior _tooltipBehaviorWeekMonthAdsBlocked;
  late TooltipBehavior _tooltipBehaviorWeekMonthCommunicationsCost;

  // this is to set the behavior and the design of the tooltip in the graph
  @override
  void initState() {
    _tooltipBehaviorAdsBlocked = TooltipBehavior(
        enable: true,
        borderColor: KBlockColors.tooltipThemeColor,
        borderWidth: 5,
        color: KBlockColors.tooltipThemeColor,
        textStyle: const TextStyle(color: KBlockColors.foregroundColor),
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return SizedBox(
            width: 80,
            height: 58,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                    child: Center(
                        child: Text(
                      '${data.tooltipHeader}',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Center(
                        child: Text('${point.x}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400)))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Center(
                        child: Text('${point.y} 件',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400))))
              ],
            ),
          );
        });
    _tooltipBehaviorCommunicationCost = TooltipBehavior(
        enable: true,
        borderColor: KBlockColors.tooltipThemeColor,
        borderWidth: 5,
        color: KBlockColors.tooltipThemeColor,
        textStyle: const TextStyle(color: KBlockColors.foregroundColor),
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return SizedBox(
            width: 80,
            height: 58,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                    child: Center(
                        child: Text(
                      '${data.tooltipHeader}',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                    child: Center(
                        child: Text('${point.x}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400)))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Center(
                        child: Text('${point.y} MB',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400))))
              ],
            ),
          );
        });
    _tooltipBehaviorWeekMonthAdsBlocked = TooltipBehavior(
        enable: true,
        borderColor: KBlockColors.tooltipThemeColor,
        borderWidth: 5,
        color: KBlockColors.tooltipThemeColor,
        textStyle: const TextStyle(color: KBlockColors.foregroundColor),
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return SizedBox(
            width: 80,
            height: 45,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                    child: Center(
                        child: Text(
                      '${data.tooltipHeader}',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                        child: Text('${point.y} 件',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400))))
              ],
            ),
          );
        });
    _tooltipBehaviorWeekMonthCommunicationsCost = TooltipBehavior(
        enable: true,
        borderColor: KBlockColors.tooltipThemeColor,
        borderWidth: 5,
        color: KBlockColors.tooltipThemeColor,
        textStyle: const TextStyle(color: KBlockColors.foregroundColor),
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return SizedBox(
            width: 80,
            height: 48,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                    child: Center(
                        child: Text(
                      '${data.tooltipHeader}',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Center(
                        child: Text('${point.y} MB',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400))))
              ],
            ),
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return historyMainTabWidget(
        context,
        ref,
        _tooltipBehaviorAdsBlocked,
        _tooltipBehaviorCommunicationCost,
        _tooltipBehaviorWeekMonthAdsBlocked,
        _tooltipBehaviorWeekMonthCommunicationsCost);
  }
}
