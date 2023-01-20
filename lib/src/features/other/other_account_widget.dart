import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors.dart';
import '../../constants/providers.dart';
import 'package:k_block_app/src/constants/urls.dart';

Widget otherAccountWidget(BuildContext context, WidgetRef ref) {
  return WillPopScope(
      onWillPop: () async {
        ref.read(widgetPathProvider.notifier).state = 3;
        return false;
      },
      child: Scaffold(
        backgroundColor: KBlockColors.white,
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
          title: Text(AppLocalizations.of(context)?.account ?? 'アプリについて',
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2, color: KBlockColors.borderLightGray))),
              child: ListTile(
                onTap: () async {
                  final url = Uri.parse(KBlockUrls.terms);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                tileColor: KBlockColors.white,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Text(
                      AppLocalizations.of(context)?.terms_of_use ?? '利用規約',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                ),
                trailing: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(Icons.chevron_right, size: 30)),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2, color: KBlockColors.borderLightGray))),
              child: ListTile(
                onTap: () async {
                  final url = Uri.parse(KBlockUrls.privacy);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                tileColor: KBlockColors.white,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Text(
                      AppLocalizations.of(context)?.privacy_policy ??
                          'プライバシーポリシー',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                ),
                trailing: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(Icons.chevron_right, size: 30)),
              ),
            ),
          ],
        ),
      ));
}
