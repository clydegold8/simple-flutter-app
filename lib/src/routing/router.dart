import 'package:flutter/material.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/common_widgets/screens/block-management-menu.dart';

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
      case Routes.whitelistRoute:
        return MaterialPageRoute(builder: (_) => const Whitelist());
      default:
        return MaterialPageRoute(builder: (_) => const KBlockLoginForm());
    }
  }
}