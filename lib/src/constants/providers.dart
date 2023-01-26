import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/constants/themes.dart';

final widgetPathProvider = StateProvider((ref) => 0);
final widgetHomePageTabProvider = StateProvider((ref) => 0);
final widgetAdsBlockedTabProvider = StateProvider((ref) => 0);
final widgetCommunicationCostTabProvider = StateProvider((ref) => 0);
final widgetHistoryMainTabProvider = StateProvider((ref) => 0);
final adBlockerSwitchStateProvider = StateProvider((ref) => false);
final selectedAppIndexProvider = StateProvider((ref) => -1);
final whiteListDeleteMode = StateProvider((ref) => false);
final blackListDeleteMode = StateProvider((ref) => false);
final isMsgReceiveSettingsOnProvider = StateProvider((ref) => true);
final isAdBlockWifiOnlyOnProvider = StateProvider((ref) => false);
final widgetSixMonthsTabProvider = StateProvider((ref) => 0);
final activeThemeNameProvider = StateProvider((ref) => ThemeNames.simple);
final lastActiveThemeNameProvider = StateProvider((ref) => ThemeNames.simple);
final activeThemeProvider =
    StateProvider((ref) => KBlockThemes.solid[ThemeNames.simple]);
final activeSwitchButtonProvider = StateProvider((ref) => 'switch');
final activeHomeBackgroundProvider = StateProvider((ref) => 'design1');
