import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/common_widgets/switch.dart';
import 'package:k_block_app/src/features/app_management/presentation/data_traffic_limit.dart';
import 'package:k_block_app/src/features/app_management_list/data_provider/app_setting_provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

class AppSettingScreenArguments {
  final String? title;
  final int? index;
  final bool? isOn;

  AppSettingScreenArguments(this.title, this.index, this.isOn);
}

Widget appSettingWidget(BuildContext context, WidgetRef ref) {
  final selectedIdx = ref.read(selectedAppIndexProvider.notifier).state;
  final appItemsList = ref.watch(appSettingItemProvider).appItems;
  final selectedItem = appItemsList[selectedIdx];

  String appName = selectedItem.name;
  String appDataUsage = selectedItem.dataUsage;
  bool isActive = selectedItem.isOn;
  bool httpsFilteringEnabled = selectedItem.httpsFilteringEnabled;
  bool firewallSettingEnabled = selectedItem.firewallSettingEnabled;
  bool dataUsageLimitEnabled = selectedItem.dataUsageLimitEnabled;
  bool dataTransmissionFeeEnabled = selectedItem.dataTransmissionFeeEnabled;

  onPressItem(index, value) {
    ref.read(appSettingItemProvider.notifier).toggleSwitch(index, value);
  }

  return Scaffold(
    appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => ref.read(widgetPathProvider.notifier).state = 6,
            icon: const Icon(Icons.arrow_back_ios, size: 25)),
        title: Text(
          appName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: KBlockColors.white,
        foregroundColor: KBlockColors.foregroundColor,
        centerTitle: true),
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
                    AppLocalizations.of(context)?.advanced_settings ?? '詳細設定')),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: KBlockColors.borderLightGray))),
          child: ListTile(
            tileColor: KBlockColors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              child: Text(
                  AppLocalizations.of(context)?.retention ?? 'K‐BLOCKによる保議',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(AppLocalizations.of(context)?.transmission ??
                  'K‐BLOCKを経由した通信'),
            ),
            trailing: SwitchWidget(
              switchValue: isActive,
              index: selectedIdx,
              updateValue: onPressItem,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: KBlockColors.borderLightGray))),
          child: ListTile(
            tileColor: KBlockColors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              child: Text(
                  AppLocalizations.of(context)?.filtering_https ??
                      'HTTPS通信のフィルタリング',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(AppLocalizations.of(context)?.block_advertising ??
                  '号化され広告をブロッグ'),
            ),
            trailing: SwitchWidget(
              switchValue: httpsFilteringEnabled,
              index: selectedIdx,
              updateValue: (index, value) {
                ref
                    .read(appSettingItemProvider.notifier)
                    .toggleHttpsFiltering(index, value);
              },
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: KBlockColors.borderLightGray))),
          child: ListTile(
            tileColor: KBlockColors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              child: Text(
                  AppLocalizations.of(context)?.firewall_settings ??
                      'ファイアウォール設定',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(AppLocalizations.of(context)?.block_entire_app_data ??
                  'アプリのデータ通信を丸ごとブロック'),
            ),
            trailing: SwitchWidget(
              switchValue: firewallSettingEnabled,
              index: selectedIdx,
              updateValue: (index, value) {
                ref
                    .read(appSettingItemProvider.notifier)
                    .toggleFirewallSetting(index, value);
              },
            ),
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
                child: Text(
                    AppLocalizations.of(context)?.data_transmission_settings ??
                        'データ通信量の設定')),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: KBlockColors.borderLightGray))),
          child: ListTile(
            tileColor: KBlockColors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              child: Text(
                  AppLocalizations.of(context)?.data_usage_limits ??
                      'データ通信量の制限',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(AppLocalizations.of(context)?.choose_data_limit ??
                  'データ通信量の上限を選択'),
            ),
            trailing: SwitchWidget(
              switchValue: dataUsageLimitEnabled,
              index: selectedIdx,
              updateValue: (index, value) {
                ref
                    .read(appSettingItemProvider.notifier)
                    .toggleDataUsageLimit(index, value);
              },
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: KBlockColors.borderLightGray))),
          child: ListTile(
            onTap: () {
              dataTrafficLimitDialogueBuilder(context);
            },
            tileColor: KBlockColors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              child: Text(
                  AppLocalizations.of(context)?.data_usage_upper_limit ??
                      'データ通信量の上限値',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                  '${AppLocalizations.of(context)?.limit_current_setting ?? '現在の設定：'} $appDataUsage'),
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
            tileColor: KBlockColors.white,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              child: Text(
                  AppLocalizations.of(context)?.transmission_fee_setting ??
                      'データ通信料の通知設定',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(AppLocalizations.of(context)?.limit_reached_notify ??
                  '上限に達した場合、端末上に警告を通知'),
            ),
            trailing: SwitchWidget(
              switchValue: dataTransmissionFeeEnabled,
              index: selectedIdx,
              updateValue: (index, value) {
                ref
                    .read(appSettingItemProvider.notifier)
                    .toggleDataTransmissionFee(index, value);
              },
            ),
          ),
        ),
      ],
    ),
  );
}
