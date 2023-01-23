import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/screens/other_settings_menu.dart';

class Logout extends ConsumerWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const OtherSettingsMenu();
  }
}