import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../whitelist/presentation/whitelist_widget.dart';

@WidgetbookUseCase(name: 'AddWhiteListPage', type: AddWhitelist)
Widget addWhiteListUseCase(BuildContext context) => const AddWhitelist();

class AddWhitelist extends ConsumerWidget {
  const AddWhitelist({super.key});

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return whitelistWidget(context, ref);
  }
}
