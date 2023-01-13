import 'package:flutter/material.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/common_widgets/screens/block-management-menu.dart';
import 'package:k_block_app/src/features/app_management/presentation/app_individual_settings.dart';
import 'package:k_block_app/src/features/app_management_list/presentation/app_management_list.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist.dart';
import 'package:k_block_app/src/features/history/presentation/history.dart';
import 'package:k_block_app/src/features/initial_popup_ios/presentation/initial_popup_ios_widget.dart';

import 'package:k_block_app/src/features/login/presentation/login_form.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist.dart';
import 'package:k_block_app/src/common_widgets/screens/common_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const KBlockLoginForm());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const CommonScreen());
      case Routes.blockManagementRoute:
        return MaterialPageRoute(builder: (_) => const BlockManagementMenu());
      case Routes.blackListsRoute:
        return MaterialPageRoute(builder: (_) => const BlackList());
      case Routes.whitelistRoute:
        return MaterialPageRoute(builder: (_) => const Whitelist());
      case Routes.initialPopupIOSRoute:
        return MaterialPageRoute(builder: (_) => const InitialPopupIOS());
      case Routes.appManagementListRoute:
        return MaterialPageRoute(builder: (_) => const AppManagementList());
      case Routes.appHistoryRoute:
        return MaterialPageRoute(builder: (_) => const History());
      case Routes.appIndividualSettingRoute:
        return MaterialPageRoute(builder: (_) => const AppIndividualSetting());
      default:
        return MaterialPageRoute(builder: (_) => const KBlockLoginForm());
    }
  }
}
