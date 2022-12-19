import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'BlackListPage', type: BlackList)
Widget blackListUseCase(BuildContext context) => const BlackList();

class BlackList extends StatelessWidget {
  const BlackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(AppLocalizations.of(context)?.blacklist != null
                ? AppLocalizations.of(context)!.blacklist
                : 'ブラックリスト')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF14B53D),
        onPressed: () {},
        child: const Icon(Icons.add,size: 30.0),
      ),
    );
  }
}
