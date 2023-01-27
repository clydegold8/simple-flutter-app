import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/simple_dialogue.dart';
import '../../constants/colors.dart';
import '../../constants/providers.dart';
import '../../constants/routes.dart';

Future<void> onMaximumDevicesReached(BuildContext context, WidgetRef ref) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          void onClickPositiveBtn() {
            Navigator.of(context).pop();
            if (Platform.isIOS) {
              Navigator.pushNamed(context, Routes.initialPopupIOSRoute);
            } else {
              Navigator.pushNamed(context, Routes.homeRoute);
              ref.read(widgetPathProvider.notifier).state = 0;
            }
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
                      AppLocalizations.of(context)?.maximum_devices_reached ??
                          "利用台数の上限を超えているため\nご利用いただけません。",
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
