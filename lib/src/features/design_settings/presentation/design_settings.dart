import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:k_block_app/src/constants/themes.dart';
import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';

import 'package:k_block_app/src/common_widgets/radio.dart';

class DesignSettings extends ConsumerStatefulWidget {
  const DesignSettings({super.key});

  @override
  ConsumerState<DesignSettings> createState() => _DesignSettingsState();
}

class _DesignSettingsState extends ConsumerState<DesignSettings> {
  @override
  Widget build(BuildContext context) {
    final List<RadioOption> themeOptions = [
      RadioOption(
          value: ThemeNames.simple,
          name: AppLocalizations.of(context)?.simple_default ?? 'グリーン（初期設定）'),
      RadioOption(
          value: ThemeNames.black,
          name: AppLocalizations.of(context)?.black ?? 'ブラック'),
      RadioOption(
          value: ThemeNames.skyBlue,
          name: AppLocalizations.of(context)?.sky_blue ?? 'スカイブルー'),
      RadioOption(
          value: ThemeNames.pink,
          name: AppLocalizations.of(context)?.pink ?? 'ピンク'),
      RadioOption(
          value: ThemeNames.green,
          name: AppLocalizations.of(context)?.green ?? 'グリーン'),
      RadioOption(
          value: ThemeNames.yellow,
          name: AppLocalizations.of(context)?.yellow ?? 'イエロー'),
      RadioOption(
          value: ThemeNames.beige,
          name: AppLocalizations.of(context)?.beige ?? 'ベージュ'),
    ];

    final List<RadioOption> switchButtonOptions = [
      RadioOption(
          value: 'switch',
          name: AppLocalizations.of(context)?.switch_default ?? 'スイッチ (初期設定)'),
      RadioOption(
          value: 'toggle',
          name: AppLocalizations.of(context)?.toggle_button ?? 'トグルボタン'),
      RadioOption(
          value: 'circle',
          name: AppLocalizations.of(context)?.circle_button ?? '○○ボタン')
    ];

    final List<RadioOption> homeBackgroundOptions = [
      RadioOption(
          value: 'design1',
          name: AppLocalizations.of(context)?.design_1 ?? 'デザイン1'),
      RadioOption(
          value: 'design2',
          name: AppLocalizations.of(context)?.design_2 ?? 'デザイン2'),
      RadioOption(
          value: 'design3',
          name: AppLocalizations.of(context)?.design_3 ?? 'デザイン3')
    ];

    final activeTheme = ref.watch(activeThemeNameProvider);
    final activeSwitchButton = ref.watch(activeSwitchButtonProvider);
    final activeHomeBackground = ref.watch(activeHomeBackgroundProvider);

    const sectionContainerDecor = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)));
    const sectionTitleStyle = TextStyle(
        color: KBlockColors.foregroundColor,
        fontSize: 14,
        fontWeight: FontWeight.w800);
    const radioTextStyle =
        TextStyle(color: KBlockColors.foregroundColor, fontSize: 14);

    void onChangedTheme(value) {
      ref.read(activeThemeNameProvider.notifier).state = value;
      ref.read(activeThemeProvider.notifier).state = KBlockThemes.solid[value];
    }

    void onChangedSwitchButton(value) {
      ref.read(activeSwitchButtonProvider.notifier).state = value;
    }

    void onChangedHomeBackground(value) {
      ref.read(activeHomeBackgroundProvider.notifier).state = value;
    }

    return Scaffold(
      appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)?.design_settings ?? 'デザイン設定'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: KBlockColors.foregroundColor,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios, size: 25))),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 21),
          decoration: sectionContainerDecor,
          margin: const EdgeInsets.fromLTRB(20, 23, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppLocalizations.of(context)?.change_theme ?? '着せかえ',
              style: sectionTitleStyle,
            ),
            ...List<Widget>.generate(
                themeOptions.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWidget(
                            selectedColor: KBlockColors.greenThemeColor,
                            value: themeOptions[index].value,
                            groupValue: activeTheme,
                            onChanged: onChangedTheme,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              themeOptions[index].name,
                              style: radioTextStyle,
                            ),
                          )
                        ],
                      ),
                    )),
          ]),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 21),
          decoration: sectionContainerDecor,
          margin: const EdgeInsets.fromLTRB(20, 23, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppLocalizations.of(context)?.switching_button_settings ??
                  'ON・OFF切り替えボタンの設定',
              style: sectionTitleStyle,
            ),
            ...List<Widget>.generate(
                switchButtonOptions.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWidget(
                            selectedColor: KBlockColors.greenThemeColor,
                            value: switchButtonOptions[index].value,
                            groupValue: activeSwitchButton,
                            onChanged: onChangedSwitchButton,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              switchButtonOptions[index].name,
                              style: radioTextStyle,
                            ),
                          )
                        ],
                      ),
                    )),
          ]),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 21),
          decoration: sectionContainerDecor,
          margin: const EdgeInsets.fromLTRB(20, 23, 20, 23),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppLocalizations.of(context)?.home_background_settings ??
                  'ホームの背景の設定',
              style: sectionTitleStyle,
            ),
            ...List<Widget>.generate(
                homeBackgroundOptions.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWidget(
                            selectedColor: KBlockColors.greenThemeColor,
                            value: homeBackgroundOptions[index].value,
                            groupValue: activeHomeBackground,
                            onChanged: onChangedHomeBackground,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              homeBackgroundOptions[index].name,
                              style: radioTextStyle,
                            ),
                          )
                        ],
                      ),
                    )),
          ]),
        )
      ])),
    );
  }
}
