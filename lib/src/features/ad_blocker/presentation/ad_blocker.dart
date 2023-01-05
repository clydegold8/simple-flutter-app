import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'ad_blocker_widget.dart';

@WidgetbookUseCase(name: 'AdBlockerPage', type: AdBlocker)
Widget addBlockerPageUseCase(BuildContext context) => const AdBlocker();

class AdBlocker extends ConsumerWidget {
  const AdBlocker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return adBlockerWidget(context, ref);
  }
}
