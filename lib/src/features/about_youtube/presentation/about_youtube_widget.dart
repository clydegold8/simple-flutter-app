import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/providers.dart';

Widget aboutYoutubeWidget(BuildContext context, WidgetRef ref) {
  const youTubeTextStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 14);
  const youTubeHeaderStyle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 16);
  var youTubeInstructionStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: KBlockColors.tooltipThemeColor);

  return WillPopScope(
      onWillPop: () async {
        ref.read(widgetPathProvider.notifier).state = 3;
        return false;
      },
      child: Scaffold(
        backgroundColor: KBlockColors.lightGray,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => {
                    ref.read(widgetPathProvider.notifier).state = 3,
                  },
              icon: const Icon(Icons.arrow_back_ios, size: 25)),
          centerTitle: true,
          backgroundColor: KBlockColors.white,
          foregroundColor: KBlockColors.foregroundColor,
          title: Text(
              AppLocalizations.of(context)?.about_youtube ?? 'YouTubeについて',
              style: youTubeHeaderStyle),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 22, 0, 17),
              child: Center(
                  child: Text(
                      AppLocalizations.of(context)?.set_up_blocking_youtube ??
                          'YouTube広告のブロック設定方法',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20))),
            ),
            //アプリでご視聴の場合 watching on app
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: KBlockColors.white),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                        AppLocalizations.of(context)?.when_watching_app ??
                            '【アプリでご視聴の場合】',
                        style: youTubeHeaderStyle),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.launch_youtube_app ??
                            '１．YouTubeアプリを起動',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.tap_youtube_video ??
                            '2．見たい動画の「⋮」ボタンをタップ \n（または見たい動画を選択）',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.tap_share ??
                            '３.「共有」ボタンをタップ',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.select_kblock ??
                            '４.「その他」の中から「K-BLOCK」を \n 選択する。',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.player_launched ??
                            '５．専用のプレイヤーが立ち上がる',
                        style: youTubeTextStyle),
                  )
                ],
              ),
            ),
            //ブラウザで視聴の場合 watching browser
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: KBlockColors.white),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                        AppLocalizations.of(context)?.watching_browser ??
                            '【ブラウザで視聴の場合】',
                        style: youTubeHeaderStyle),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.access_youtube ??
                            '１．ブラウザからhttps://m.youtube.com \n にアクセスする',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.tap_video_to_watch ??
                            '2. 見たい動画の「⋮」ボタンをタップ \n (または見たい動画を直接選択)',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.tap_share_btn ??
                            '3.「共有」ボタンをタップ',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)?.select_kblock_on_list ??
                            '4.「その他」の中から「K-BLOCK」を \n 選択する',
                        style: youTubeTextStyle),
                  ),
                  SizedBox(
                    width: 25,
                    height: 23,
                    child: SvgPicture.asset('assets/icons/arrow_head_down.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    decoration: youTubeInstructionStyle,
                    child: Text(
                        AppLocalizations.of(context)
                                ?.a_dedicated_player_launched ??
                            '5. 専用のプレイヤーが立ち上がる',
                        style: youTubeTextStyle),
                  )
                ],
              ),
            )
          ],
        ),
      ));
}
