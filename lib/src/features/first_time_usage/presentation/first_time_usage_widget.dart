import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../dialogs/serial_code_incorrect_dialog.dart';

Widget firstTimeUserWidget(BuildContext context, WidgetRef ref) {
  void onProcessSerialNumber() {
    onSerialCodeIncorrect(context, ref);
  }

  return GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
            child: SvgPicture.asset('assets/icons/logo_kblock.svg')),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
          child: Text(AppLocalizations.of(context)?.a_serial_code_required ??
              'K-BLOCKを利用するには  シリアルコードが必要です。'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 60, 40, 23),
          child: TextField(
            // style: const TextStyle(height: 2),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)?.enter_serial_code ??
                  'シリアルコードの入力',
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: KBlockColors.greenThemeColor, width: 2.0),
              ),
              filled: true,
              fillColor: KBlockColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 20, 45, 7),
          child: Center(
            child: OutlinedButton(
              onPressed: () => onProcessSerialNumber(),
              style: OutlinedButton.styleFrom(
                  foregroundColor: KBlockColors.text01,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  )),
              child: SizedBox(
                  height: 55.0,
                  child: Center(
                      child: Text(
                          AppLocalizations.of(context)?.enter_btn ?? '認正',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: KBlockColors.white, fontSize: 16)))),
            ),
          ),
        )
      ]),
    ),
  );
}
