import 'package:flutter_riverpod/flutter_riverpod.dart';

final widgetPathProvider = StateProvider((ref) => 0);
final widgetHomePageTabProvider = StateProvider((ref) => 0);
final widgetAdsBlockedTabProvider = StateProvider((ref) => 0);
final widgetCommunicationCostTabProvider = StateProvider((ref) => 0);
final adBlockerSwitchStateProvider = StateProvider((ref) => false);
final whiteListDeleteMode = StateProvider((ref) => false);
final blackListDeleteMode = StateProvider((ref) => false);
final appAdStatusProvider = StateProvider((ref) =>
    [true, true, true, true, true, true, true, true, true, true, true]);

