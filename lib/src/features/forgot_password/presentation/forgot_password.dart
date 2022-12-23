import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/constants/colors.dart';

Future<void> forgotPassword(BuildContext context) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            child: SizedBox(
              height: 250,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: KBlockColors.foregroundColor,
                                size: 25.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 35, 0, 37),
                          child: Center(
                            child: Text(
                                AppLocalizations.of(context)?.password_reset ??
                                    'パスワードの再設定',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: KBlockColors.foregroundColor,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(41, 0, 41, 22),
                    child: TextField(
                        style: const TextStyle(height: 2),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 16),
                          filled: true,
                          hintText:
                              AppLocalizations.of(context)?.enter_id ?? 'IDを入力',
                          fillColor: KBlockColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15.0),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 7),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: KBlockColors.text01,
                            backgroundColor: KBlockColors.disabledTheme,
                            side: const BorderSide(
                                color: KBlockColors.disabledTheme),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            )),
                        child: SizedBox(
                          width: double.infinity,
                          height: 55.0,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                      AppLocalizations.of(context)?.resetting ??
                                          '再設定用URLを送信',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: KBlockColors.disabledFontTheme,
                                          height: 1.5,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    },
  );
}
