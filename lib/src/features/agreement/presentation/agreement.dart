import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/constants/urls.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/providers.dart';

class Agreement extends ConsumerStatefulWidget {
  const Agreement({super.key});

  @override
  ConsumerState<Agreement> createState() => _AgreementState();
}

class _AgreementState extends ConsumerState<Agreement> {
  bool isAgreeChecked = false;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: KBlockColors.foregroundColor,
        fontSize: 15,
        fontWeight: FontWeight.w500);
    final bulletBox = Padding(
      padding: const EdgeInsets.only(left: 5.5, right: 5.5),
      child: Container(
        height: 12,
        width: 12,
        decoration: const BoxDecoration(color: Color(0xFF494848)),
      ),
    );
    const underlineDecoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(color: KBlockColors.foregroundColor, width: 1)));

    void onTapTermsOfUse() async {
      final url = Uri.parse(KBlockUrls.terms);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    void onTapPrivacyPolicy() async {
      final url = Uri.parse(KBlockUrls.privacy);
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
        ref.read(widgetPathProvider.notifier).state = 0;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(children: [
        const Spacer(flex: 1),
        Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SvgPicture.asset('assets/icons/logo_kblock.svg')),
        Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 33),
            child: SvgPicture.asset('assets/icons/tutorial_illustration.svg')),
        Padding(
            padding: const EdgeInsets.only(bottom: 29),
            child: Text(
                AppLocalizations.of(context)?.agreement_desciprtion ??
                    '利用規約、プライバシーポリシーを\nご確認頂き、同意の上ご利用\nください。',
                style: textStyle)),
        Padding(
            padding: const EdgeInsets.only(bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  bulletBox,
                  GestureDetector(
                      onTap: onTapTermsOfUse,
                      child: Container(
                        decoration: underlineDecoration,
                        child: Text(
                            AppLocalizations.of(context)?.terms_of_use ??
                                '利用規約',
                            style: textStyle.copyWith(height: 1)),
                      )),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    bulletBox,
                    GestureDetector(
                      onTap: onTapPrivacyPolicy,
                      child: Container(
                        decoration: underlineDecoration,
                        child: Text(
                            AppLocalizations.of(context)?.privacy_policy ??
                                'プライバシーポリシー',
                            style: textStyle.copyWith(height: 1)),
                      ),
                    )
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              side: const BorderSide(
                                  color: KBlockColors.foregroundColor),
                              value: isAgreeChecked,
                              onChanged: (value) {
                                setState(() {
                                  isAgreeChecked = value!;
                                });
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            AppLocalizations.of(context)?.agree ?? '同意する',
                            style: textStyle,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: KBlockColors.requiredBackground,
                              borderRadius: BorderRadius.circular(3)),
                          child: const Padding(
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
              AppLocalizations.of(context)?.start ?? '利用開始',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
        const Spacer(flex: 1),
        const Padding(
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
