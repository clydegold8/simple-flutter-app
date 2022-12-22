import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/colors.dart';
import '../../../constants/routes.dart';

Widget initialPopupIOSWidget(BuildContext context) {
  String howToSafari = AppLocalizations.of(context)?.safari_ad_blocking != null
        ? AppLocalizations.of(context)!.safari_ad_blocking
        : 'Safariで広告ブロックの設定方法';

  return Scaffold(
    backgroundColor: KBlockColors.white,
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Center(
            child: Text(howToSafari,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: KBlockColors.text01,
                fontWeight: FontWeight.bold,
              )),
            )
        ),
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
                )
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Center(
            child: SizedBox(
              width: 350.0,
              child: Container(
                color: KBlockColors.lightGray,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Column(
                  children: const <Widget>[
                    Text('【お願い】'),
                    Text('こちらの設定は広告ブロックをONにする\n前に行ってください。'),
                  ],
                ),
                )
              ),
            ),
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: SizedBox(
              width: 350.0,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '1. iPhone の ',
                            style: TextStyle(color: KBlockColors.text02),
                          ),
                          WidgetSpan(
                            child: Image.asset(
                              'assets/icons/ios_setting.png',
                            )
                          ),
                          const TextSpan(
                            text: '「設定」アプリを開く',
                            style: TextStyle(color: KBlockColors.text02),
                          ),
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '2. ',
                            style: TextStyle(color: KBlockColors.text02),
                          ),
                          WidgetSpan(
                            child: Image.asset(
                              'assets/icons/safari.png',
                            )
                          ),
                          const TextSpan(
                            text: '「Safari」を開く',
                            style: TextStyle(color: KBlockColors.text02),
                          ),
                        ]
                      ),
                    ),
                    const Text('3. 「拡張機能」を開く', style: TextStyle(color: KBlockColors.text02)),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '4. ',
                            style: TextStyle(color: KBlockColors.text02),
                          ),
                          WidgetSpan(child: SvgPicture.asset('assets/icons/app_logo_empty.svg')),
                          const TextSpan(
                            text: '「K-BLOCK」をONにする    ',
                            style: TextStyle(color: KBlockColors.text02),
                          ),
                          WidgetSpan(child: SvgPicture.asset('assets/icons/switch_on.svg')),
                        ]
                      ),
                    ),
                    const Text('5. 設定完了', style: TextStyle(color: KBlockColors.text02)),
                  ],
                ),
                )
              ),
            ),
        ),
         Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: SizedBox(
              height: 50,
              width: 350,
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
                child: const Text('設定する'),
              ),
            ),
          )
        ),
      ],
    ),);
}