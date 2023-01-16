import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/colors.dart';

//TODO: this should be refactored it shouldn't be in this file
import '../../features/history/presentation/history_ads_blocked.dart';

Widget lineGraphWidget(
    BuildContext context,
    TooltipBehavior tooltipBehavior,
    List<GraphData> data,
    String graphTitleHeader,
    String tooltipTitle) {

  final containerDecoration = BoxDecoration(
      color: KBlockColors.tabUnselectedBackground,
      borderRadius: BorderRadius.circular(0),
      border:
      Border.all(width: 1, color: KBlockColors.tabUnselectedBackground));

  const dateTextStyle = TextStyle(
      color: KBlockColors.foregroundColor,
      fontSize: 13,
      fontWeight: FontWeight.w400);

  return Column(children: [
    Expanded(
      flex: 7,
      child: SfCartesianChart(
          backgroundColor: KBlockColors.white,
          title: ChartTitle(
              textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: KBlockColors.foregroundColor),
              text: graphTitleHeader),
          // Enable tooltip
          tooltipBehavior: tooltipBehavior,
          primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(
            width: 1,
            color: KBlockColors.text02,
            dashArray: <double>[5, 5],
          )),
          primaryYAxis: NumericAxis(
              interval: 30,
              majorGridLines: const MajorGridLines(
                  width: 1,
                  color: KBlockColors.text02,
                  dashArray: <double>[5, 5])),
          // Chart title
          series: <ChartSeries<GraphData, String>>[
            LineSeries<GraphData, String>(
              dataSource: data,
              name: tooltipTitle,
              markerSettings: const MarkerSettings(
                  isVisible: true, borderColor: KBlockColors.text02),
              color: KBlockColors.greenThemeColor,
              xValueMapper: (GraphData data, _) => data.time,
              yValueMapper: (GraphData data, _) => data.consumedData,
            )
          ]),
    ),
    Expanded(
        child: Padding(
            padding: const EdgeInsets.only(left: 35, right: 9, bottom: 15),
            child: Container(
              width: double.infinity,
              decoration: containerDecoration,
              child: const Center(
                child: Text(style: dateTextStyle, '9月30日'),
              ),
            )))
    //Initialize the chart widget
  ]);
}
