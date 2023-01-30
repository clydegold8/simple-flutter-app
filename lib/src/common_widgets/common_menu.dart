import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_block_app/src/common_widgets/screens/block-management-menu.dart';
import 'package:k_block_app/src/common_widgets/screens/home_screen.dart';
import 'package:k_block_app/src/common_widgets/screens/other_settings_menu.dart';
import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/features/about_youtube/presentation/about_youtube.dart';
import 'package:k_block_app/src/features/account_settings/presentation/account_settings.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist.dart';
import 'package:k_block_app/src/features/app_management/presentation/app_individual_settings.dart';
import 'package:k_block_app/src/features/app_management_list/presentation/app_management_list.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist.dart';
import 'package:k_block_app/src/features/design_settings/presentation/design_settings.dart';
import 'package:k_block_app/src/features/history/presentation/history.dart';
import 'package:k_block_app/src/features/other/other_account.dart';

import '../constants/providers.dart';

const List<Widget> widgetOptions = <Widget>[
  HomeScreen(),
  BlockManagementMenu(),
  History(),
  OtherSettingsMenu(),
  AddWhitelist(),
  BlackList(),
  AppManagementList(),
  AppIndividualSetting(),
  AccountSettings(),
  OtherAccount(),
  AboutYoutube(),
  DesignSettings(),
];

class CommonMenu {
  static Widget generateBottomNavigationBar(
      BuildContext context, int selectedIndex, ref) {
    void onItemTapped(int index) {
      ref.read(widgetPathProvider.notifier).state = index;
      Future.delayed(const Duration(milliseconds: 350), () async {
        ref.read(widgetHomePageTabProvider.notifier).state = 0;
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              height: 24,
              child: selectedIndex == 0
                  ? SvgPicture.asset(
                      'assets/icons/home_selected.svg',
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : SvgPicture.asset('assets/icons/home.svg'),
            ),
            label: AppLocalizations.of(context)!.home),
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              height: 24,
              child: selectedIndex == 1
                  ? SvgPicture.asset(
                      'assets/icons/block_control_selected.svg',
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : SvgPicture.asset('assets/icons/block_control.svg'),
            ),
            label: AppLocalizations.of(context)!.block_control),
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              height: 24,
              child: selectedIndex == 2
                  ? SvgPicture.asset(
                      'assets/icons/history_selected.svg',
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : SvgPicture.asset('assets/icons/history.svg'),
            ),
            label: AppLocalizations.of(context)!.history),
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              height: 24,
              child: selectedIndex == 3
                  ? SvgPicture.asset(
                      'assets/icons/others_selected.svg',
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : SvgPicture.asset('assets/icons/others.svg'),
            ),
            label: AppLocalizations.of(context)!.others),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      unselectedItemColor: KBlockColors.text01,
      unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal, fontSize: 10, height: 2),
      selectedItemColor: Theme.of(context)
          .colorScheme
          .primary, //KBlockColors.commonMenuIconSelected,
      selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal, fontSize: 10, height: 2),
    );
  }
}
