import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/constants/colors.dart';

import 'ad_blocker_tab.dart';

Widget adBlockerWidget(BuildContext context) {
  return Column(children: [
    Container(
      color: KBlockColors.greenLight,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 13),
        child: Center(
            child: Text(
                AppLocalizations.of(context)?.ad_block_suspended ?? '広告ブロック停止中',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: KBlockColors.foregroundColor))),
      ),
    ),
    Expanded(
      flex: 6,
      child: _adBlockingWidget(context),
    ),
    const Expanded(
      flex: 5,
      child: AdBlockerTab(),
    )
  ]);
}

Widget _adBlockingWidget(BuildContext context) {
  final adBlockerButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: KBlockColors.buttonPositiveBackground,
      side: const BorderSide(color: KBlockColors.buttonPositiveBackground),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  const adBlockerButtonTextStyle = TextStyle(fontSize: 12);

  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          KBlockColors.adBlockerGradient1,
          KBlockColors.adBlockerGradient2
        ])),
    child: FractionallySizedBox(
      heightFactor: 0.85,
      widthFactor: 0.75,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: KBlockColors.boxShadow,
                  blurRadius: 6,
                  offset: Offset(0, 3))
            ],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(image: AssetImage('assets/images/ad_blocker_off.png')),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: OutlinedButton(
                onPressed: () {},
                style: adBlockerButtonStyle,
                child: Text(
                    AppLocalizations.of(context)?.ad_block_browser_only ??
                        'ブラウザのみで広告ブロック',
                    style: adBlockerButtonTextStyle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: OutlinedButton(
                  onPressed: () {},
                  style: adBlockerButtonStyle,
                  child: Text(
                      AppLocalizations.of(context)?.ad_block_apps_block ??
                          'アプリとブラウザで広告ブロック',
                      style: adBlockerButtonTextStyle)),
            )
          ])),
    ),
  );
}
