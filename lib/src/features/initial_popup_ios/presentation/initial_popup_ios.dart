import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/colors.dart';
import '../../../constants/routes.dart';

Widget initialPopupIOSWidget(BuildContext context) {
  String howToSafari = AppLocalizations.of(context)?.safari_ad_blocking != null
      ? AppLocalizations.of(context)!.safari_ad_blocking
      : 'Safariで広告ブロックの設定方法';
  String requestText = AppLocalizations.of(context)?.request != null
      ? AppLocalizations.of(context)!.request
      : '【お願い】';
  String requestSubText = AppLocalizations.of(context)?.request_subtitle != null
      ? AppLocalizations.of(context)!.request_subtitle
      : 'こちらの設定は広告ブロックをONにする\n前に行ってください。';
  String instruction1A = AppLocalizations.of(context)?.instruction_1_1 != null
      ? AppLocalizations.of(context)!.instruction_1_1
      : 'iPhoneの';
  String instruction1B = AppLocalizations.of(context)?.instruction_1_2 != null
      ? AppLocalizations.of(context)!.instruction_1_2
      : '「設定」アプリを開く';
  String instruction2 = AppLocalizations.of(context)?.instruction_2 != null
      ? AppLocalizations.of(context)!.instruction_2
      : '「Safari」を開く';
  String instruction3 = AppLocalizations.of(context)?.instruction_3 != null
      ? AppLocalizations.of(context)!.instruction_3
      : '「拡張機能」を開く';
  String instruction4 = AppLocalizations.of(context)?.instruction_4 != null
      ? AppLocalizations.of(context)!.instruction_4
      : '「K-BLOCK」をONにする';
  String instruction5 = AppLocalizations.of(context)?.instruction_5 != null
      ? AppLocalizations.of(context)!.instruction_5
      : '設定完了';
  String setupLabel = AppLocalizations.of(context)?.setup != null
      ? AppLocalizations.of(context)!.setup
      : '設定する';

  return Scaffold(
    backgroundColor: KBlockColors.white,
    body: Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 20, 0),
            child: Center(
              child: Text(howToSafari,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: KBlockColors.foregroundColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Center(
              child: SizedBox(
                  width: 35.0,
                  height: 2.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: KBlockColors.greenThemeColor,
                      border: Border.all(
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Center(
              child: SizedBox(
                width: 350.0,
                child: Container(
                    color: KBlockColors.lightGray,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            requestText,
                            style: const TextStyle(
                              color: KBlockColors.foregroundColor,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            requestSubText,
                            style: const TextStyle(
                              color: KBlockColors.foregroundColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
            width: 350.0,
            child: SizedBox(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: instruction1A,
                            ),
                            WidgetSpan(
                                child: Image.asset(
                              'assets/icons/ios_setting.png',
                            )),
                            TextSpan(
                              text: instruction1B,
                            ),
                          ],
                          style: const TextStyle(
                            color: KBlockColors.text02,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '2. ',
                              style: TextStyle(color: KBlockColors.text02),
                            ),
                            WidgetSpan(
                                child: Image.asset(
                              'assets/icons/safari.png',
                            )),
                            TextSpan(
                              text: instruction2,
                              style:
                                  const TextStyle(color: KBlockColors.text02),
                            ),
                          ],
                          style: const TextStyle(
                            color: KBlockColors.text02,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(instruction3,
                        style: const TextStyle(
                          color: KBlockColors.text02,
                          fontSize: 15,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '4. ',
                            ),
                            WidgetSpan(
                                child: SvgPicture.asset(
                                    'assets/icons/app_logo_empty.svg')),
                            TextSpan(
                              text: instruction4,
                            ),
                            WidgetSpan(
                                child: SvgPicture.asset(
                                    'assets/icons/switch_on.svg')),
                          ],
                          style: const TextStyle(
                            color: KBlockColors.text02,
                            fontSize: 15,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(instruction5,
                        style: const TextStyle(
                            color: KBlockColors.text02, fontSize: 16)),
                  )
                ],
              ),
            )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Center(
              child: SizedBox(
                height: 50,
                width: 300,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.homeRoute);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: KBlockColors.greenThemeColor,
                    foregroundColor: KBlockColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text(setupLabel),
                ),
              ),
            )),
      ],
    ),
  );
}
