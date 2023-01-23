import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:k_block_app/src/constants/themes.dart';
import 'package:k_block_app/src/constants/colors.dart';

import 'package:k_block_app/src/common_widgets/radio.dart';

final List<RadioOption> _themeOptions = [
  RadioOption(value: KBlockThemes.simple, name: 'グリーン（初期設定）'),
  RadioOption(value: KBlockThemes.black, name: 'ブラック'),
  RadioOption(value: KBlockThemes.skyBlue, name: 'スカイブルー'),
  RadioOption(value: KBlockThemes.pink, name: 'ピンク'),
  RadioOption(value: KBlockThemes.green, name: 'グリーン'),
  RadioOption(value: KBlockThemes.yellow, name: 'イエロー'),
  RadioOption(value: KBlockThemes.beige, name: 'ベージュ'),
  RadioOption(value: KBlockThemes.gradient, name: 'グラデーション'),
];

final List<RadioOption> _switchButtonOptions = [
  RadioOption(value: 'switch', name: 'スイッチ (初期設定)'),
  RadioOption(value: 'toggle', name: 'トグルボタン'),
  RadioOption(value: 'circle', name: '○○ボタン')
];

final List<RadioOption> _homeBackgroundOptions = [
  RadioOption(value: 'design1', name: 'デザイン1'),
  RadioOption(value: 'design2', name: 'デザイン2'),
  RadioOption(value: 'design3', name: 'デザイン3')
];

class DesignSettings extends ConsumerStatefulWidget {
  const DesignSettings({super.key});

  @override
  ConsumerState<DesignSettings> createState() => _DesignSettingsState();
}

class _DesignSettingsState extends ConsumerState<DesignSettings> {
  String activeTheme = KBlockThemes.simple;
  String activeSwitchButton = 'switch';
  String activeHomeBackground = 'design1';

  @override
  Widget build(BuildContext context) {
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
      setState(() {
        activeTheme = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('デザイン設定'),
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
              '着せかえ',
              style: sectionTitleStyle,
            ),
            ...List<Widget>.generate(
                _themeOptions.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWidget(
                            selectedColor: KBlockColors.greenThemeColor,
                            value: _themeOptions[index].value,
                            groupValue: activeTheme,
                            onChanged: onChangedTheme,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              _themeOptions[index].name,
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
              'ON・OFF切り替えボタンの設定',
              style: sectionTitleStyle,
            ),
            ...List<Widget>.generate(
                _switchButtonOptions.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWidget(
                            selectedColor: KBlockColors.greenThemeColor,
                            value: _switchButtonOptions[index].value,
                            groupValue: activeSwitchButton,
                            onChanged: onChangedTheme,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              _switchButtonOptions[index].name,
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
              'ホームの背景の設定',
              style: sectionTitleStyle,
            ),
            ...List<Widget>.generate(
                _homeBackgroundOptions.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWidget(
                            selectedColor: KBlockColors.greenThemeColor,
                            value: _homeBackgroundOptions[index].value,
                            groupValue: activeHomeBackground,
                            onChanged: onChangedTheme,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              _homeBackgroundOptions[index].name,
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
