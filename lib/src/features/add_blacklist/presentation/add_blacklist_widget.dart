import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:k_block_app/src/features/blacklist/data_provider/blacklist_list_provider.dart';

import '../../../constants/colors.dart';

Future<void> addBlacklist(BuildContext context, WidgetRef ref) {
  String blackListName = '';

  addBlackListItem(WidgetRef ref) {
    ref
        .read(blackListProvider.notifier)
        .addBlackList(BlackListItem(blackListName));
    Navigator.pop(context);
  }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Center(
              child: ListBody(
            children: <Widget>[
              Center(
                  child: Text(
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: KBlockColors.foregroundColor),
                      AppLocalizations.of(context)?.add_blacklist ??
                          'ブラックリスト追加')),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: KBlockColors.foregroundColor),
                      AppLocalizations.of(context)?.domain_wish_to_block ??
                          'ブロックしたいドメインを入力してください。')),
              Stack(
                children: <Widget>[
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: JustTheTooltip(
                            tailLength: 7.0,
                            backgroundColor:
                                KBlockColors.tabUnselectedBackground,
                            borderRadius: BorderRadius.circular(0.0),
                            preferredDirection: AxisDirection.up,
                            elevation: 10.0,
                            margin: const EdgeInsets.fromLTRB(
                              57,
                              0,
                              0,
                              0,
                            ),
                            isModal: true,
                            content: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  30,
                                  0,
                                  30,
                                  0,
                                ),
                                child: Text(
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: KBlockColors.foregroundColor),
                                  AppLocalizations.of(context)
                                          ?.tooltip_content ??
                                      'https：//のあとに表示されるドメインを入力',
                                ),
                              ),
                            ),
                            child: const Icon(
                              size: 30,
                              Icons.help,
                              color: KBlockColors.buttonNeutralForeground,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 25, 33, 0),
                      child: TextField(
                          style: const TextStyle(height: 1),
                          onChanged: (value) {
                            blackListName = value;
                          },
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            hintText: 'blacklist.com',
                            fillColor: KBlockColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 15.0),
                          )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
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
                      onPressed: () =>
                          blackListName != '' ? addBlackListItem(ref) : null,
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              KBlockColors.buttonPositiveBackground,
                          side: const BorderSide(
                              color: KBlockColors.buttonPositiveBackground),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      child: SizedBox(
                        height: 40.0,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 8, 25, 0),
                            child: SizedBox(
                                child: Text(
                                    AppLocalizations.of(context)?.add_btn ??
                                        '追加',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
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
      );
    },
  );
}
