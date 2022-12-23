import 'package:flutter/material.dart';

class AdBlockerTab extends StatefulWidget {
  const AdBlockerTab({super.key});

  @override
  State<AdBlockerTab> createState() => _AdBlockerTabState();
}

class _AdBlockerTabState extends State<AdBlockerTab>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final tabs = ['24時間', '前日', '1週間', '1ヶ月', '6ヶ月'];

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
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFF14B53D), width: 1))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 31, 20, 0),
            child: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
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
                                  color: _selectedIndex == index
                                      ? Color(0xFF14B53D)
                                      : Color(0xFFDEDCDC),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  tabs[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _selectedIndex == index
                                          ? Colors.white
                                          : Color(0xFF9C9B98),
                                      fontWeight: _selectedIndex == index
                                          ? FontWeight.w900
                                          : FontWeight.normal),
                                ),
                              )),
                        )),
                onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            _adBlockerTabBarViewData(context, '3500', '60MB'),
            _adBlockerTabBarViewData(context, '4800', '80MB'),
            _adBlockerTabBarViewData(context, '25000', '80MB'),
            _adBlockerTabBarViewData(context, '10万', '480MB'),
            _adBlockerTabBarViewData(context, '60万', '2GB')
          ]),
        )
      ],
    );
  }
}

Widget _adBlockerTabBarViewData(
    BuildContext context, String numBlocks, String dataCommSav) {
  final containerDecoration = BoxDecoration(
      color: Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1, color: Color(0xFFDEDCDC)),
      boxShadow: const [
        BoxShadow(color: Color(0x16000000), blurRadius: 6, offset: Offset(0, 3))
      ]);
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
                    numBlocks,
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
                    dataCommSav,
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
