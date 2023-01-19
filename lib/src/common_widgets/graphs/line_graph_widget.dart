import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/colors.dart';
//TODO: this should be refactored it shouldn't be in this file
import '../../features/history/presentation/history_ads_blocked.dart';

DateTime weekdayOf(DateTime time, int weekday) =>
    time.add(Duration(days: weekday - time.weekday));

DateTime saturdayOf(DateTime time) => weekdayOf(time, 6);

DateTime sundayOf(DateTime time) => weekdayOf(time, 7);

Widget lineGraphWidget(
    BuildContext context,
    TooltipBehavior tooltipBehavior,
    List<GraphData> data,
    String graphTitleHeader,
    String tooltipTitle,
    bool isScrollable,
    ZoomPanBehavior zoomPanBehavior,
    double? visibleMaximum,
    DateFormat dateFormat,
    DateTimeIntervalType intervalType,
    String monthName,
    bool hasWeekendColors) {
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
          zoomPanBehavior: zoomPanBehavior,
          backgroundColor: KBlockColors.white,
          title: ChartTitle(
              textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: KBlockColors.foregroundColor),
              text: graphTitleHeader),
          // Enable tooltip
          tooltipBehavior: tooltipBehavior,
          primaryXAxis: DateTimeAxis(
              plotOffset: 20,
              visibleMinimum: data[0].time,
              visibleMaximum: data[6].time,
              dateFormat: dateFormat,
              intervalType: intervalType,
              majorGridLines: const MajorGridLines(
                width: 1,
                color: KBlockColors.text02,
                dashArray: <double>[5, 5],
              ),
              axisLabelFormatter: (axisLabelRenderArgs) {
                final text = dateFormat.format(
                    DateTime.fromMillisecondsSinceEpoch(
                        axisLabelRenderArgs.value.toInt()));

                final saturdayDate = dateFormat.format(saturdayOf(
                    DateTime.fromMillisecondsSinceEpoch(
                        axisLabelRenderArgs.value.toInt())));

                final sundayDate = dateFormat.format(sundayOf(
                    DateTime.fromMillisecondsSinceEpoch(
                        axisLabelRenderArgs.value.toInt())));

                TextStyle style = (hasWeekendColors && saturdayDate == text
                    ? const TextStyle(
                        color: KBlockColors.blueDate,
                        fontWeight: FontWeight.w400)
                    : hasWeekendColors && sundayDate == text
                        ? const TextStyle(
                            color: KBlockColors.redDate,
                            fontWeight: FontWeight.w400)
                        : const TextStyle(
                            color: KBlockColors.foregroundColor,
                            fontWeight: FontWeight.w400));
                return ChartAxisLabel(text, style);
              }),
          primaryYAxis: NumericAxis(
              anchorRangeToVisiblePoints: false,
              interval: 30,
              majorGridLines: const MajorGridLines(
                  width: 1,
                  color: KBlockColors.text02,
                  dashArray: <double>[5, 5])),
          // Chart title
          series: <ChartSeries<GraphData, DateTime>>[
            LineSeries<GraphData, DateTime>(
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
              child: Center(
                child: Text(style: dateTextStyle, monthName),
              ),
            )))
    //Initialize the chart widget
  ]);
}
