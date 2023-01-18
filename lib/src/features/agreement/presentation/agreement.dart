import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/routes.dart';

class Agreement extends StatefulWidget {
  const Agreement({super.key});

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool isAgreeChecked = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: KBlockColors.foregroundColor,
        fontSize: 15,
        fontWeight: FontWeight.w500);
    final bulletBox = Padding(
      padding: EdgeInsets.only(left: 5.5, right: 5.5),
      child: Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(color: Color(0xFF494848)),
      ),
    );

    void onTapTermsOfUse() async {
      final url = Uri.parse(
          'https://google.com'); // TODO: Terms of Use URL to be decided
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    void onTapPrivacyPolicy() async {
      final url = Uri.parse(
          'https://google.com'); // TODO: Privacy Policy URL to be decided
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    void onPressedStart() {
      if (Platform.isIOS) {
        Navigator.pushNamed(context, Routes.initialPopupIOSRoute);
      } else {
        Navigator.pushNamed(context, Routes.homeRoute);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(children: [
        const Spacer(flex: 1),
        Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: SvgPicture.asset('assets/icons/logo_kblock.svg')),
        Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Image.asset('assets/images/tutorial_illust.png')),
        Padding(
            padding: EdgeInsets.only(bottom: 29),
            child: Text('利用規約、プライバシーポリシーを\nご確認頂き、同意の上ご利用\nください。',
                style: textStyle)),
        Padding(
            padding: EdgeInsets.only(bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  bulletBox,
                  GestureDetector(
                      onTap: onTapTermsOfUse,
                      child: Text(
                        '利用規約',
                        style: textStyle.copyWith(
                            decoration: TextDecoration.underline),
                      )),
                ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  bulletBox,
                  GestureDetector(
                    onTap: onTapPrivacyPolicy,
                    child: Text('プライバシーポリシー',
                        style: textStyle.copyWith(
                            decoration: TextDecoration.underline)),
                  )
                ]),
                Padding(
                    padding: EdgeInsets.only(top: 28),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              side: BorderSide(
                                  color: KBlockColors.foregroundColor),
                              value: isAgreeChecked,
                              onChanged: (value) {
                                setState(() {
                                  isAgreeChecked = value!;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            '同意する',
                            style: textStyle,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: KBlockColors.requiredBackground,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                              child: Text(
                                '必要',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500),
                              )),
                        )
                      ],
                    ))
              ],
            )),
        SizedBox(
          height: 50,
          width: 300,
          child: OutlinedButton(
            onPressed: isAgreeChecked ? onPressedStart : null,
            style: OutlinedButton.styleFrom(
              disabledForegroundColor: KBlockColors.white,
              disabledBackgroundColor: KBlockColors.greenThemeColor,
              backgroundColor: KBlockColors.greenThemeColor,
              foregroundColor: KBlockColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            child: Text(
              '利用開始',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: EdgeInsets.only(bottom: 33),
          child: Text(
            '@Stock Tech.Inc',
            style: TextStyle(
                color: KBlockColors.text01,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ])),
    );
  }
}
