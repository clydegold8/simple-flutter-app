import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';

import 'package:k_block_app/src/common_widgets/switch.dart';

class OtherSettingsMenu extends ConsumerStatefulWidget {
  const OtherSettingsMenu({super.key});

  @override
  ConsumerState<OtherSettingsMenu> createState() => _OtherSettingsMenuState();
}

class _OtherSettingsMenuState extends ConsumerState<OtherSettingsMenu> {
  bool isMsgReceiveSettingsOn = true;
  bool isAdBlockWifiOnlyOn = false;

  void toggleMsgReceiveSettingsOn(index, value) {
    setState(() {
      isMsgReceiveSettingsOn = value;
    });
  }

  void toggleAdBlockWifiOnlyOn(index, value) {
    setState(() {
      isAdBlockWifiOnlyOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const listTileContDecoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 2, color: KBlockColors.tileBorder)));
    const listTileTitleStyle = TextStyle(
        color: KBlockColors.foregroundColor,
        fontSize: 16,
        fontWeight: FontWeight.w800);
    const listTileSubtitleStyle =
        TextStyle(color: KBlockColors.tileSub, fontSize: 12);
    final aboutSectionIconContDecoration = BoxDecoration(
        color: KBlockColors.greenIcon, borderRadius: BorderRadius.circular(56));
    const aboutSectionTextStyle =
        TextStyle(color: KBlockColors.foregroundColor, fontSize: 8);
    const trailingChevron = Padding(
        padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
        child: Icon(Icons.chevron_right, size: 30));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.others ?? 'その他',
          style: const TextStyle(
              color: KBlockColors.foregroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: KBlockColors.lightGray,
      body: Column(children: [
        Container(
          color: Colors.white,
          child: ListView(shrinkWrap: true, children: [
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  onTap: () {
                    ref.read(widgetPathProvider.notifier).state = 8;
                  },
                  title: Text(
                    AppLocalizations.of(context)?.account_settings ?? 'アカウント',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    AppLocalizations.of(context)?.account_settings_subtitle ??
                        'シリアルコード・アプリのバージョン確認',
                    style: listTileSubtitleStyle,
                  ),
                  trailing: trailingChevron),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)?.design_settings ?? 'デザイン設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    AppLocalizations.of(context)?.design_settings_subtitle ??
                        '着せかえ・デザインの変更',
                    style: listTileSubtitleStyle,
                  ),
                  trailing: trailingChevron),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)?.notification_settings ??
                        '通知設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    AppLocalizations.of(context)
                            ?.notification_settings_subtitle ??
                        '広告ブロック数・節約約通信量をお知らせ',
                    style: listTileSubtitleStyle,
                  ),
                  trailing: trailingChevron),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)?.msg_receive_settings ??
                        'メッセージR受信設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    AppLocalizations.of(context)
                            ?.msg_receive_settings_subtitle ??
                        'Docomo回線をご利用の方のみ',
                    style: listTileSubtitleStyle,
                  ),
                  trailing: SwitchWidget(
                    index: 0,
                    switchValue: isMsgReceiveSettingsOn,
                    updateValue: toggleMsgReceiveSettingsOn,
                  )),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)?.ad_block_wifi_only ??
                        'Wi-Fi接続時のみ広告ブロック',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    AppLocalizations.of(context)?.ad_block_wifi_only_subtitle ??
                        'モバイルデータ通信を利用せず広告をブロック',
                    style: listTileSubtitleStyle,
                  ),
                  trailing: SwitchWidget(
                    index: 1,
                    switchValue: isAdBlockWifiOnlyOn,
                    updateValue: toggleAdBlockWifiOnlyOn,
                  )),
            )
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 12, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () async {
                      final url = Uri.parse(
                          'https://google.com'); // TODO: URL to be decided
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 56,
                          width: 56,
                          margin: const EdgeInsets.only(bottom: 7),
                          decoration: aboutSectionIconContDecoration,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14),
                            child: SvgPicture.asset('assets/icons/faq.svg'),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)?.faq ?? 'よくある質問',
                          textAlign: TextAlign.center,
                          style: aboutSectionTextStyle,
                        )
                      ],
                    )),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: const EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 14),
                        child: SvgPicture.asset('assets/icons/app.svg'),
                      ),
                    ),
                    Text(AppLocalizations.of(context)?.about_app ?? 'アプリについて',
                        textAlign: TextAlign.center,
                        style: aboutSectionTextStyle)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: const EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: SvgPicture.asset('assets/icons/youtube.svg'),
                      ),
                    ),
                    Text(
                        AppLocalizations.of(context)?.about_youtube_ad ??
                            'YouTube広告\nについて',
                        textAlign: TextAlign.center,
                        style: aboutSectionTextStyle)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: const EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: SvgPicture.asset('assets/icons/mail.svg'),
                      ),
                    ),
                    Text(AppLocalizations.of(context)?.contact_us ?? 'お問い合わせ',
                        textAlign: TextAlign.center,
                        style: aboutSectionTextStyle)
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
