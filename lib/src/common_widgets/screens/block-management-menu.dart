import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../constants/colors.dart';
import '../../constants/providers.dart';

@WidgetbookUseCase(name: 'BlockManagementMenu', type: BlockManagementMenu)
BlockManagementMenu blockManagementUseCase(BuildContext context) =>
    const BlockManagementMenu();

class BlockManagementMenu extends ConsumerWidget {
  const BlockManagementMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: KBlockColors.lightGray,
      appBar: AppBar(
        backgroundColor: KBlockColors.white,
        foregroundColor: KBlockColors.foregroundColor,
        title: Center(
            child: Text(
                AppLocalizations.of(context)?.block_management ?? 'ブロック管理')),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: KBlockColors.borderLightGray))),
            child: ListTile(
              title: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                      AppLocalizations.of(context)?.browser_management ??
                          'ブラウザの管理')),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: KBlockColors.borderLightGray))),
            child: ListTile(
              onTap: () {
                ref.read(widgetPathProvider.notifier).state = 4;
              },
              tileColor: KBlockColors.white,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                child: Text(
                    AppLocalizations.of(context)?.whitelist ?? 'ホワイトリスト',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text(
                    AppLocalizations.of(context)?.register_pages_to_not_block ??
                        'ブロックしたくないWebページを登録'),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(Icons.chevron_right, size: 30)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: KBlockColors.borderLightGray))),
            child: ListTile(
              onTap: () {
                ref.read(widgetPathProvider.notifier).state = 5;
              },
              tileColor: KBlockColors.white,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                child: Text(
                    AppLocalizations.of(context)?.blacklist ?? 'ブラックリスト',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text(
                    AppLocalizations.of(context)?.register_pages_to_block ??
                        'ブロックしたいWebページを登録'),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(Icons.chevron_right, size: 30)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: KBlockColors.borderLightGray))),
            child: ListTile(
              title: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(AppLocalizations.of(context)?.app_management ??
                      'アプリの管理')),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: KBlockColors.borderLightGray))),
            child: ListTile(
              onTap: () {
                ref.read(widgetPathProvider.notifier).state = 6;
              },
              tileColor: KBlockColors.white,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                child: Text(
                    AppLocalizations.of(context)?.detail_app_settings ??
                        'アプリの細かい設定',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text(AppLocalizations.of(context)?.set_ad_block ??
                    'アプリことに広告ブロックを設定'),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(Icons.chevron_right, size: 30)),
            ),
          ),
        ],
      ),
    );
  }
}
