import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/simple_dialogue.dart';
import '../../constants/colors.dart';
import 'maximum_devices_reached.dart';

Future<void> onSerialCodeIncorrect(BuildContext context, WidgetRef ref) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          void onClickPositiveBtn() {
            //ToDo: This will be changed later on
            Navigator.of(context).pop();
            onMaximumDevicesReached(context, ref);
          }

          return SimpleDialogueWidget(
              showNegativeBtn: false,
              onClickPositiveBtn: onClickPositiveBtn,
              positiveBtnText: AppLocalizations.of(context)?.close_btn ?? "閉じる",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      AppLocalizations.of(context)?.incorrect_serial_code ??
                          "シリアルコードが正しくありません。\n もう一度入力し直してください。",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: KBlockColors.foregroundColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ));
        });
      });
}
