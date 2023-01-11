import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';

Widget accountSettingsWidget(BuildContext context, WidgetRef ref) {
  const serialNo = '7tdn4SyuRUh!59s83x6z';
  const appVersion = '3.23.0';
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
          onTap: () async {
            await Clipboard.setData(const ClipboardData(text: serialNo));
          },
          title: Text(
            AppLocalizations.of(context)?.serial_code ?? 'シリアルコード',
            style: listTileTitleStyle,
          ),
          subtitle: const Text(serialNo, style: listTileSubtitleStyle),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: SvgPicture.asset('assets/icons/copy.svg'),
          ),
        ),
      ),
      Container(
        decoration: listTileContDecoration,
        child: ListTile(
          title: Text(
            AppLocalizations.of(context)?.version_info ?? 'バージョン情報',
            style: listTileTitleStyle,
          ),
          subtitle: const Text(appVersion, style: listTileSubtitleStyle),
          trailing: const Padding(
              padding: EdgeInsets.only(top: 7),
              child: Icon(Icons.chevron_right, size: 30)),
        ),
      )
    ]),
  );
}
