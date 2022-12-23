import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/features/forgot_password/presentation/forgot_password.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/routes.dart';

Widget loginFormWidget(BuildContext context, formKey) {
  return Scaffold(
      backgroundColor: KBlockColors.white,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 92, 0, 84),
              child: Center(
                child: SvgPicture.asset('assets/icons/logo_kblock.svg'),
              ),
            ),
            // Id Field
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Center(
                child: Text(AppLocalizations.of(context)?.id ?? 'ID',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: KBlockColors.foregroundColor,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 28),
              child: TextField(
                  style: const TextStyle(height: 2),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: KBlockColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15.0),
                  )),
            ),
            // password field
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Center(
                child: Text(
                    AppLocalizations.of(context)?.password != null
                        ? AppLocalizations.of(context)!.password
                        : 'パスワード',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: KBlockColors.foregroundColor,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 23),
              child: TextField(
                style: const TextStyle(height: 2),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: KBlockColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15.0),
                ),
              ),
            ),
            // forgot password link
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 48),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)?.forgot_password ??
                            'パスワードをお忘れですか?',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: KBlockColors.foregroundColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            forgotPassword(context);
                          })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 45, 7),
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.homeRoute);
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: KBlockColors.text01,
                      backgroundColor: KBlockColors.greenThemeColor,
                      side:
                          const BorderSide(color: KBlockColors.greenThemeColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      )),
                  child: SizedBox(
                      height: 55.0,
                      child: Center(
                          child: Text(
                              AppLocalizations.of(context)?.login ?? 'ログイン',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: KBlockColors.white, fontSize: 16)))),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  children: [
                                TextSpan(
                                    text: AppLocalizations.of(context)?.terms ??
                                        '利用規約 ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final url = Uri.parse(
                                            'https://google.com'); // TODO: Terms of Use URL to be decided
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      }),
                                TextSpan(
                                    text:
                                        AppLocalizations.of(context)?.privacy ??
                                            '/ プライバシーポリシー ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final url = Uri.parse(
                                            'https://google.com'); // TODO: Privacy Policy URL to be decided
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      })
                              ],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: KBlockColors.text01,
                                  ))),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: Text('@Stock Tech.Inc',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: KBlockColors.text01,
                                )),
                          )
                        ]))))
          ],
        ),
      ));
}
