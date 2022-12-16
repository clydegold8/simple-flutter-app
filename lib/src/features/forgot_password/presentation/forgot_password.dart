import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Color(0xFF898989),
                          size: 16,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                    child: Center(
                      child: Text(
                          AppLocalizations.of(context)?.password_reset != null
                              ? AppLocalizations.of(context)!.password_reset
                              : 'パスワードの再設定',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF656565),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
                    child: TextField(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 12),
                      filled: true,
                      hintText: AppLocalizations.of(context)?.enter_id != null
                          ? AppLocalizations.of(context)!.enter_id
                          : 'IDを入力',
                      fillColor: const Color(0xFFFFFFFF),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15.0),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 15, 34, 7),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
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
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 12),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                      AppLocalizations.of(context)?.resetting !=
                                              null
                                          ? AppLocalizations.of(context)!
                                              .resetting
                                          : '再設定用URLを送信',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xFF656565),
                                          height: 1.5,
                                          fontSize: 12,
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
