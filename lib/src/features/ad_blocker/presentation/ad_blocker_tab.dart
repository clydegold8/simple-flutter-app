import 'package:flutter/material.dart';

class AdBlockerTab extends StatefulWidget {
  const AdBlockerTab({super.key});

  @override
  State<AdBlockerTab> createState() => _AdBlockerTabState();
}

class _AdBlockerTabState extends State<AdBlockerTab>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static const tabDecoration = BoxDecoration(
      color: Color(0xFFDEDCDC),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)));

  final tabs = ['24時間', '前日'];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: _selectedIndex,
        animationDuration: Duration.zero,
        vsync: this,
        length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: List.generate(
              tabs.length,
              (index) => Tab(
                    child: Container(
                        decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Color(0xFF14B53D)
                                : Color(0xFFDEDCDC),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(tabs[index]),
                        )),
                  )),
          indicatorColor: Colors.transparent,
          onTap: (index) => setState(() {
            _selectedIndex = index;
          }),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            _adBlockerTabBarViewData(context, 3500, 60),
            _adBlockerTabBarViewData(context, 2500, 120)
          ]),
        )
      ],
    );
  }
}

Widget _adBlockerTabBarViewData(
    BuildContext context, int numBlocks, int dataCommSav) {
  final containerDecoration = BoxDecoration(
      color: Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1, color: Color(0xFFDEDCDC)));
  const dataTextStyle = TextStyle(
      color: Color(0xFF494848), fontSize: 28, fontWeight: FontWeight.w800);
  const titleTextStyle = TextStyle(color: Color(0xFF494848), fontSize: 13);

  return Row(children: [
    Expanded(
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 127,
            decoration: containerDecoration,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    numBlocks.toString(),
                    style: dataTextStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'ブロック数',
                    style: titleTextStyle,
                  ),
                )
              ],
            )),
      ),
    ),
    Expanded(
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: 127,
            decoration: containerDecoration,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    '${dataCommSav}MB',
                    style: dataTextStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'データ通信節約量',
                    style: titleTextStyle,
                  ),
                )
              ],
            )),
      ),
    )
  ]);
}
