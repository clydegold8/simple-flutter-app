
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../constants/colors.dart';
import 'history_main_tab.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});


  @override
  HistoryState createState() => HistoryState();

}
class HistoryState extends ConsumerState<History> {

  late TooltipBehavior _tooltipBehavior;

  // this is to set the behavior and the design of the tooltip in the graph
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        borderColor: KBlockColors.tooltipThemeColor,
        borderWidth: 5,
        color: KBlockColors.tooltipThemeColor,
        textStyle: const TextStyle(color: KBlockColors.foregroundColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return historyMainTabWidget(context, ref, _tooltipBehavior);
  }

}
