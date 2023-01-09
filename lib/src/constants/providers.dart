import 'package:flutter_riverpod/flutter_riverpod.dart';

final widgetPathProvider = StateProvider((ref) => 0);
final widgetHomePageTabProvider = StateProvider((ref) => 0);
final isAdBlockerOnProvider = StateProvider((ref) => false);
final appAdStatusProvider = StateProvider((ref) =>
    [true, true, true, true, true, true, true, true, true, true, true]);
