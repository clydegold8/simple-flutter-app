import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/features/forgot_password/presentation/forgot_password.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/routes.dart';

Widget loginFormWidget(BuildContext context, formKey) {
  return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 91, 0, 72),
              child: Center(
                child: Text('K-BLOCK',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF656565),
                    )),
              ),
            ),
            // Id Field
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
              child: Center(
                child: Text(
                    AppLocalizations.of(context)?.id != null
                        ? AppLocalizations.of(context)!.id
                        : 'ID',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xFF656565),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
              )),
            ),
            // password field
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 6),
              child: Center(
                child: Text(
                    AppLocalizations.of(context)?.password != null
                        ? AppLocalizations.of(context)!.password
                        : 'パスワード',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xFF656565),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Color(0xFF898989)),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15.0),
                ),
              ),
            ),
            // forgot password link
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)?.forgot_password !=
                                null
                            ? AppLocalizations.of(context)!.forgot_password
                            : 'パスワードをお忘れですか?',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xFF656565),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            forgotPassword(context);
                          })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 30, 34, 7),
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.whitelistRoute);
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF656565),
                      backgroundColor: const Color(0xFFFFFFFF),
                      side: const BorderSide(color: Color(0xFF898989)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      )),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                        child: SizedBox(
                            width: double.infinity,
                            child: Text(
                                AppLocalizations.of(context)?.login != null
                                    ? AppLocalizations.of(context)!.login
                                    : 'ログイン',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF656565),
                                )))),
                  ),
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
                                    text: AppLocalizations.of(context)?.terms !=
                                            null
                                        ? AppLocalizations.of(context)!.terms
                                        : '利用規約 ',
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
                                    text: AppLocalizations.of(context)
                                                ?.privacy !=
                                            null
                                        ? AppLocalizations.of(context)!.privacy
                                        : '/ プライバシーポリシー ',
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
                                    fontSize: 15,
                                    color: Color(0xFF656565),
                                  ))),
                          const Text('@Stock Tech.Inc',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xFF656565),
                              )),
                        ]))))
          ],
        ),
      ));
}
