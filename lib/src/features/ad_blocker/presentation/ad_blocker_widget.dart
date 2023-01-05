import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/constants/colors.dart';

import 'ad_blocker_control.dart';
import 'ad_blocker_tab.dart';

Widget adBlockerWidget(BuildContext context, WidgetRef ref) {
  return Column(children: [
    Container(
      color: KBlockColors.greenLight,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 13),
        child: Center(
            child: Text(
                AppLocalizations.of(context)?.ad_block_suspended ?? '広告ブロック停止中',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: KBlockColors.foregroundColor))),
      ),
    ),
    const Expanded(
      flex: 6,
      child: AdBlockerControl(),
    ),
    Expanded(
      child: adBlockerTabWidget(context, ref),
    )
  ]);
}
