import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_block_app/src/common_widgets/simple_dialogue.dart';
import 'package:k_block_app/src/common_widgets/switch.dart';
import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:k_block_app/src/constants/urls.dart';

class OtherSettingsMenu extends ConsumerStatefulWidget {
  const OtherSettingsMenu({super.key});

  @override
  ConsumerState<OtherSettingsMenu> createState() => _OtherSettingsMenuState();
}

class _OtherSettingsMenuState extends ConsumerState<OtherSettingsMenu> {
  Future<void> _onPressedContactUs(BuildContext context) {
    const radioVisualDensity = VisualDensity(horizontal: -4, vertical: -4);
    const radioTextStyle = TextStyle(color: KBlockColors.text02, fontSize: 14);

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          String inquiryOption = 'ads_wont_dissapear';

          return StatefulBuilder(builder: (context, setState) {
            void onChangedRadio(value) {
              setState(() {
                inquiryOption = value.toString();
              });
            }

            void onClickNegativeBtn() {
              Navigator.of(context).pop();
            }

            void onClickPositiveBtn() {
              Navigator.of(context).pop();
            }

            return SimpleDialogueWidget(
                mainAxisAlignmentBtnRow: MainAxisAlignment.spaceBetween,
                onClickNegativeBtn: onClickNegativeBtn,
                onClickPositiveBtn: onClickPositiveBtn,
                negativeBtnText:
                    AppLocalizations.of(context)?.cancel ?? "キャンセル",
                positiveBtnText: AppLocalizations.of(context)?.ok ?? "OK",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        AppLocalizations.of(context)?.contents_of_inquiry ??
                            "お問い合わせ内容",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: KBlockColors.foregroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.9,
                                child: Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: radioVisualDensity,
                                    activeColor: KBlockColors.text02,
                                    value: "ads_wont_dissapear",
                                    groupValue: inquiryOption,
                                    onChanged: onChangedRadio),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                        ?.ads_wont_dissapear ??
                                    "広告が消えない",
                                style: radioTextStyle,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.9,
                                child: Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: radioVisualDensity,
                                    activeColor: KBlockColors.text02,
                                    value: "no_idea",
                                    groupValue: inquiryOption,
                                    onChanged: onChangedRadio),
                              ),
                              Text(
                                AppLocalizations.of(context)?.no_idea ??
                                    "使い方がわからない",
                                style: radioTextStyle,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.9,
                                child: Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: radioVisualDensity,
                                    activeColor: KBlockColors.text02,
                                    value: "not_listed",
                                    groupValue: inquiryOption,
                                    onChanged: onChangedRadio),
                              ),
                              Text(
                                AppLocalizations.of(context)?.not_listed ??
                                    "上記以外の不具合",
                                style: radioTextStyle,
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 0.9,
                              child: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: radioVisualDensity,
                                  activeColor: KBlockColors.text02,
                                  value: "others",
                                  groupValue: inquiryOption,
                                  onChanged: onChangedRadio),
                            ),
                            Text(
                              AppLocalizations.of(context)?.others ?? "その他",
                              style: radioTextStyle,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final isMsgReceiveSettingsOn = ref.watch(isMsgReceiveSettingsOnProvider);
    final isAdBlockWifiOnlyOn = ref.watch(isAdBlockWifiOnlyOnProvider);

    void toggleMsgReceiveSettingsOn(index, value) {
      ref.read(isMsgReceiveSettingsOnProvider.notifier).state = value;
    }

    void toggleAdBlockWifiOnlyOn(index, value) {
      ref.read(isAdBlockWifiOnlyOnProvider.notifier).state = value;
    }

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
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      AppLocalizations.of(context)?.account_settings_subtitle ??
                          'シリアルコード・アプリのバージョン確認',
                      style: listTileSubtitleStyle,
                    ),
                  ),
                  trailing: trailingChevron),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  onTap: () {
                    ref.read(widgetPathProvider.notifier).state = 11;
                  },
                  title: Text(
                    AppLocalizations.of(context)?.design_settings ?? 'デザイン設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      AppLocalizations.of(context)?.design_settings_subtitle ??
                          '着せかえ・デザインの変更',
                      style: listTileSubtitleStyle,
                    ),
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
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      AppLocalizations.of(context)
                              ?.notification_settings_subtitle ??
                          '広告ブロック数・節約約通信量をお知らせ',
                      style: listTileSubtitleStyle,
                    ),
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
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      AppLocalizations.of(context)
                              ?.msg_receive_settings_subtitle ??
                          'Docomo回線をご利用の方のみ',
                      style: listTileSubtitleStyle,
                    ),
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
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      AppLocalizations.of(context)
                              ?.ad_block_wifi_only_subtitle ??
                          'モバイルデータ通信を利用せず広告をブロック',
                      style: listTileSubtitleStyle,
                    ),
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
            padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () async {
                      final url = Uri.parse(KBlockUrls.faq);
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
                GestureDetector(
                  onTap: () {
                    ref.read(widgetPathProvider.notifier).state = 9;
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
                          child: SvgPicture.asset('assets/icons/app.svg'),
                        ),
                      ),
                      Text(AppLocalizations.of(context)?.about_app ?? 'アプリについて',
                          textAlign: TextAlign.center,
                          style: aboutSectionTextStyle)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(widgetPathProvider.notifier).state = 10;
                  },
                  child: Column(
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
                ),
                GestureDetector(
                  onTap: () => _onPressedContactUs(context),
                  child: Column(
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
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
