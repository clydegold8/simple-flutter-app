import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:k_block_app/src/constants/colors.dart';

class OtherSettingsMenu extends StatefulWidget {
  const OtherSettingsMenu({super.key});

  @override
  State<OtherSettingsMenu> createState() => _OtherSettingsMenuState();
}

class _OtherSettingsMenuState extends State<OtherSettingsMenu> {
  @override
  Widget build(BuildContext context) {
    const listTileContDecoration = BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: Color(0x12000000))));
    const listTileTitleStyle = TextStyle(
        color: Color(0xFF494848), fontSize: 16, fontWeight: FontWeight.w800);
    const listTileSubtitleStyle =
        TextStyle(color: Color(0xFF71706C), fontSize: 12);
    final aboutSectionIconContDecoration = BoxDecoration(
        color: Color(0xFFB3E2B5), borderRadius: BorderRadius.circular(56));
    const aboutSectionTextStyle =
        TextStyle(color: Color(0xFF494848), fontSize: 8);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'その他',
          style: TextStyle(color: Color(0xFF494848)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(children: [
        Container(
          color: Colors.white,
          child: ListView(shrinkWrap: true, children: [
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    'アカウント',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    'シリアルコード・アプリのバージョン確認',
                    style: listTileSubtitleStyle,
                  )),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    'デザイン設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    '着せかえ・デザインの変更',
                    style: listTileSubtitleStyle,
                  )),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    '通知設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    '広告ブロック数・節約約通信量をお知らせ',
                    style: listTileSubtitleStyle,
                  )),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    'メッセージR受信設定',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    'Docomo回線をご利用の方のみ',
                    style: listTileSubtitleStyle,
                  )),
            ),
            Container(
              decoration: listTileContDecoration,
              child: ListTile(
                  title: Text(
                    'Wi-Fi接続時のみ広告ブロック',
                    style: listTileTitleStyle,
                  ),
                  subtitle: Text(
                    'モバイルデータ通信を利用せず広告をブロック',
                    style: listTileSubtitleStyle,
                  )),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 12, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 14),
                        child: SvgPicture.asset('assets/icons/faq.svg'),
                      ),
                    ),
                    Text(
                      'よくある質問',
                      style: aboutSectionTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 14),
                        child: SvgPicture.asset('assets/icons/app.svg'),
                      ),
                    ),
                    Text('アプリについて', style: aboutSectionTextStyle)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: SvgPicture.asset('assets/icons/youtube.svg'),
                      ),
                    ),
                    Text('YouTube広告\nについて', style: aboutSectionTextStyle)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      margin: EdgeInsets.only(bottom: 7),
                      decoration: aboutSectionIconContDecoration,
                      child: Padding(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: SvgPicture.asset('assets/icons/mail.svg'),
                      ),
                    ),
                    Text('お問い合わせ', style: aboutSectionTextStyle)
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
