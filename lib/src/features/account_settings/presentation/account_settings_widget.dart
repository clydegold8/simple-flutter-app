import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';

import 'package:k_block_app/src/common_widgets/simple_dialogue.dart';

const _serialNo = '7tdn4SyuRUh!59s83x6z';
const _appVersion = '3.23.0';
const _newAppVersion = '3.23.0';

const _dialogueTextStyle = TextStyle(
    color: KBlockColors.simpleDialogueText,
    fontSize: 14,
    fontWeight: FontWeight.w500);

Future<void> _onPressedSerialCode(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        void onClickPositiveBtn() async {
          Navigator.of(context).pop();
          await Clipboard.setData(const ClipboardData(text: _serialNo));
        }

        return SimpleDialogueWidget(
          edgeInsetsBtnPadding: const EdgeInsets.only(top: 17),
          onClickPositiveBtn: onClickPositiveBtn,
          positiveBtnText: AppLocalizations.of(context)?.close ?? '閉じる',
          showNegativeBtn: false,
          child: Text(
            AppLocalizations.of(context)?.serial_code_copied ??
                'クリップボードにシアルコード\nがコピーされました。',
            style: _dialogueTextStyle,
          ),
        );
      });
}

Future<void> _onPressedAppVersion(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final positiveBtnText = _appVersion == _newAppVersion
            ? (AppLocalizations.of(context)?.close ?? '閉じる')
            : (AppLocalizations.of(context)?.update_now ?? '閉じる');
        final contentText = _appVersion == _newAppVersion
            ? AppLocalizations.of(context)?.using_latest_version ??
                '最新版をご利用中です。'
            : AppLocalizations.of(context)?.update_to_new_version ??
                '最新版へのアップデートを\nお願いします。';

        void onClickPositiveBtn() async {
          Navigator.of(context).pop();
        }

        return SimpleDialogueWidget(
          edgeInsetsBtnPadding: const EdgeInsets.only(top: 17),
          onClickPositiveBtn: onClickPositiveBtn,
          positiveBtnText: positiveBtnText,
          showNegativeBtn: false,
          child: Text(contentText, style: _dialogueTextStyle),
        );
      });
}

Widget accountSettingsWidget(BuildContext context, WidgetRef ref) {
  const listTileContDecoration = BoxDecoration(
      border:
          Border(bottom: BorderSide(width: 2, color: KBlockColors.tileBorder)));
  const listTileTitleStyle = TextStyle(
      color: KBlockColors.foregroundColor,
      fontSize: 16,
      fontWeight: FontWeight.w800);
  const listTileSubtitleStyle =
      TextStyle(color: KBlockColors.tileSub, fontSize: 12);

  return Scaffold(
    appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.account_settings ?? 'アカウント',
            style: const TextStyle(
                color: KBlockColors.foregroundColor,
                fontSize: 16,
                fontWeight: FontWeight.w800)),
        backgroundColor: Colors.white,
        foregroundColor: KBlockColors.foregroundColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => {
                  ref.read(widgetPathProvider.notifier).state = 3,
                },
            icon: const Icon(Icons.arrow_back_ios, size: 25))),
    body: ListView(children: [
      Container(
        decoration: listTileContDecoration,
        child: ListTile(
          title: Text(
            AppLocalizations.of(context)?.serial_code ?? 'シリアルコード',
            style: listTileTitleStyle,
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(_serialNo, style: listTileSubtitleStyle),
          ),
          trailing: GestureDetector(
            onTap: () => _onPressedSerialCode(context),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: SvgPicture.asset('assets/icons/copy.svg'),
            ),
          ),
        ),
      ),
      Container(
        decoration: listTileContDecoration,
        child: ListTile(
          onTap: () => _onPressedAppVersion(context),
          title: Text(
            AppLocalizations.of(context)?.version_info ?? 'バージョン情報',
            style: listTileTitleStyle,
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(_appVersion, style: listTileSubtitleStyle),
          ),
          trailing: const Padding(
              padding: EdgeInsets.only(top: 7),
              child: Icon(Icons.chevron_right, size: 30)),
        ),
      )
    ]),
  );
}
