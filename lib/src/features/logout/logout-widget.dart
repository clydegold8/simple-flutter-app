import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/constants/routes.dart';

import '../../constants/colors.dart';

Future<void> logOutWidget(BuildContext context, WidgetRef ref) {
  goLogout() {
    Navigator.pushNamed(context, Routes.loginRoute);
  }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Center(
                child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(
                      AppLocalizations.of(context)?.sure_to_logout ??
                          'ログアウトしてよろしいですか?',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: KBlockColors.text01,
                            side: const BorderSide(
                                color: KBlockColors.buttonNeutralForeground),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        child: SizedBox(
                          height: 40.0,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                              child: SizedBox(
                                  child: Text(
                                      AppLocalizations.of(context)?.cancel ??
                                          'キャンセル',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: KBlockColors
                                              .buttonNeutralForeground,
                                          height: 1.5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)))),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => goLogout(),
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                KBlockColors.buttonPositiveBackground,
                            side: const BorderSide(
                                color: KBlockColors.buttonPositiveBackground),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        child: const SizedBox(
                          height: 40.0,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(25, 8, 25, 0),
                              child: SizedBox(
                                  child: Text('OK',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: KBlockColors.white,
                                          height: 1.5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      );
    },
  );
}
