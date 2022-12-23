import 'package:flutter/material.dart';

import 'ad_blocker_tab.dart';

Widget adBlockerWidget(BuildContext context) {
  return Column(children: [
    Container(
      color: Color(0xFF89D68C),
      child: const Padding(
        padding: EdgeInsets.only(top: 15, bottom: 13),
        child: Center(
            child: Text('広告ブロック停止中',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF494848)))),
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
      side: const BorderSide(color: Color(0xFFFF612A)),
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
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x16000000), blurRadius: 6, offset: Offset(0, 3))
            ],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(image: AssetImage('assets/images/ad_blocker_off.png')),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: OutlinedButton(
                onPressed: () {},
                style: adBlockerButtonStyle,
                child: Text('ブラウザのみで広告ブロック'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: OutlinedButton(
                  onPressed: () {},
                  style: adBlockerButtonStyle,
                  child: Text('アプリとブラウザで広告ブロック')),
            )
          ])),
    ),
  );
}
