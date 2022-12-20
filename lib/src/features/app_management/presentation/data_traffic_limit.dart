import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:k_block_app/src/constants/colors.dart';

Future<void> dataTrafficLimitDialogueBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) => dataTrafficLimitDialogue(context));
}

Widget dataTrafficLimitDialogue(BuildContext context) {
  return SimpleDialog(
    title: Center(
        child: Text(AppLocalizations.of(context)!.set_data_traffic,
            style: const TextStyle(color: KBlockColors.text02))),
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 13, 32, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 13),
                child: SizedBox(
                    width: 120,
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: KBlockColors.text02)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: KBlockColors.text02)),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8)),
                    )),
              ),
              Text('GB', style: TextStyle(color: KBlockColors.text02))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 43,
                    width: 116,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: KBlockColors.buttonNeutralForeground,
                          side: const BorderSide(
                              color: KBlockColors.buttonNeutralForeground),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(AppLocalizations.of(context)!.cancel),
                    )),
                SizedBox(
                    height: 43,
                    width: 116,
                    child: ButtonTheme(
                        minWidth: 500.0,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    KBlockColors.buttonPositiveBackground,
                                side: const BorderSide(
                                    color:
                                        KBlockColors.buttonPositiveBackground),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(AppLocalizations.of(context)!.ok))))
              ],
            ),
          )
        ]),
      )
    ],
  );
}
