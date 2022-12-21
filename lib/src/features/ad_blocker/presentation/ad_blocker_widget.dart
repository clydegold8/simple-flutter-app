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
      child: _adBlockerTabDetails(context),
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

Widget _adBlockerTabDetails(BuildContext context) {
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
        child: TabBarView(children: [Text('1'), Text('2')]),
      )
    ]),
  );
}
