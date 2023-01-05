import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/common_widgets/switch.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget appManagementListWidget(BuildContext context, WidgetRef ref) {
  String appManagementText =
      AppLocalizations.of(context)?.app_management ?? 'アプリ管理';
  final List<String> appNames = <String>['Facebook', 'Messenger'];

  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => ref.read(widgetPathProvider.notifier).state = 1,
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      title: Center(
        child: Text(
          appManagementText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      backgroundColor: KBlockColors.white,
      foregroundColor: KBlockColors.foregroundColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show Snackbar',
          onPressed: () {},
        ),
      ],
    ),
    body: ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      itemCount: appNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: KBlockColors.white,
          child: Row(
            children: [
              Center(child: Text('Entry ${appNames[index]}')),
              const Center(
                child: SwitchWidget(),
              )
            ],
          ),
        );
      },
    ),
  );
}
