import 'package:flutter/material.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/features/login/presentation/login_form.dart';
import 'package:k_block_app/src/common_widgets/home_page.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const KBlockLoginForm());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.whitelistRoute:
        return MaterialPageRoute(builder: (_) => const Whitelist());
      default:
        return MaterialPageRoute(builder: (_) => const KBlockLoginForm());
    }
  }
}
