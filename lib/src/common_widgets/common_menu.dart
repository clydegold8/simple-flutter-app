import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/common_widgets/screens/home_screen.dart';

const List<Widget> widgetOptions = <Widget>[
  HomeScreen(),
  Text('Block Control Screen'),
  Text('History Screen'),
  Text('Others Screen'),
];

class CommonMenu {
  static Widget generateBottomNavigationBar(
      BuildContext context, int selectedIndex, Function(int) onItemTapped) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset('assets/icons/home.svg'),
            ),
            label: AppLocalizations.of(context)!.home),
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset('assets/icons/block_control.svg'),
            ),
            label: AppLocalizations.of(context)!.block_control),
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset('assets/icons/history.svg'),
            ),
            label: AppLocalizations.of(context)!.history),
        BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset('assets/icons/others.svg'),
            ),
            label: AppLocalizations.of(context)!.others),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      fixedColor: KBlockColors.text01,
      unselectedIconTheme: const IconThemeData(size: 24),
      unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal, fontSize: 10, height: 2),
      selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal, fontSize: 10, height: 2),
    );
  }
}
