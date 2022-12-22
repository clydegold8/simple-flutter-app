import 'package:flutter/material.dart';

Widget adBlockerWidget(BuildContext context) {
  return Column(children: [
    Container(
      color: Color(0xFF89D68C),
      child: const Padding(
        padding: EdgeInsets.only(top: 15, bottom: 13),
        child: Center(child: Text('広告ブロック停止中')),
      ),
    ),
    Expanded(
      child: _adBlockingWidget(context),
    ),
    Expanded(
      child: _adBlockerTabDetailsWidget(context),
    )
  ]);
}

Widget _adBlockingWidget(BuildContext context) {
  final adBlockerButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Color(0xFFFF612A),
      side: BorderSide(color: Color(0xFFFF612A)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFBDEFBF), Color(0x34B3E2B5)])),
    child: FractionallySizedBox(
        heightFactor: 0.85,
        widthFactor: 0.75,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Image(
                      image: AssetImage('assets/images/ad_blocker_off.png')),
                  OutlinedButton(
                    onPressed: () {},
                    style: adBlockerButtonStyle,
                    child: Text('ブラウザのみで広告ブロック'),
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      style: adBlockerButtonStyle,
                      child: Text('アプリとブラウザで広告ブロック'))
                ]))),
  );
}

Widget _adBlockerTabDetailsWidget(BuildContext context) {
  return DefaultTabController(
    initialIndex: 0,
    length: 2,
    child: Column(children: [
      TabBar(
          indicator: BoxDecoration(
              color: Color(0xFF14B53D),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          tabs: [
            Tab(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFDEDCDC),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('24時間'),
                  )),
            ),
            Tab(
              child: Text('前日'),
            )
          ]),
      Expanded(
        child: TabBarView(children: [
          _adBlockerTabBarViewData(context, 3500, 60),
          _adBlockerTabBarViewData(context, 2500, 120)
        ]),
      )
    ]),
  );
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
