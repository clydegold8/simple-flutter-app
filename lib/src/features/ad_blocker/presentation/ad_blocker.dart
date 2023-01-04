import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'ad_blocker_state.dart';

@WidgetbookUseCase(name: 'AdBlockerPage', type: AdBlocker)
Widget addBlockerPageUseCase(BuildContext context) => const AdBlocker();

class AdBlocker extends StatefulWidget {
  const AdBlocker({super.key});

  @override
  State<AdBlocker> createState() => AdBlockerState();
}
