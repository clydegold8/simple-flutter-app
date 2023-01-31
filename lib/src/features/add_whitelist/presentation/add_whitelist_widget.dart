import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../whitelist/data_provider/whitelist_lists_provider.dart';

Future<void> addWhitelist(BuildContext context, WidgetRef ref) {
  String whiteListName = '';

  addWhiteListItem(WidgetRef ref) {
    ref
        .read(whiteListListProvider.notifier)
        .addWhiteList(WhiteListItem(whiteListName));
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
                      AppLocalizations.of(context)?.add_whitelist ??
                          'ホワイトリスト追加')),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: KBlockColors.foregroundColor),
                      AppLocalizations.of(context)?.domain_dont_want_to_block ??
                          'ブロックしたいドメインを入力してください')),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
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
                            child: SvgPicture.asset(
                                'assets/icons/question_mark.svg',
                                height: 28),
                          )),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 33, 0),
                      child: TextField(
                          onChanged: (value) {
                            whiteListName = value;
                          },
                          cursorColor: KBlockColors.text02,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            hintText: 'whitelist.com',
                            fillColor: KBlockColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: KBlockColors.text02, width: 2),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15.0),
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
                          whiteListName != '' ? addWhiteListItem(ref) : null,
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
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
