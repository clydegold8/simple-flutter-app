import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'blacklist_widget.dart';

@WidgetbookUseCase(name: 'BlackListPage', type: BlackList)
Widget blackListUseCase(BuildContext context) => const BlackList();

class BlackList extends ConsumerWidget {
  const BlackList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return blackListWidget(context, ref);
  }
}
