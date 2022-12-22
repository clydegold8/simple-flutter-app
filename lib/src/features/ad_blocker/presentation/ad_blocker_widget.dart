import 'package:flutter/material.dart';

import 'ad_blocker_tab.dart';

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
    const Expanded(
      child: AdBlockerTab(),
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
