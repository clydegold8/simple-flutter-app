import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'WhiteListPage', type: Whitelist)
Widget whiteListUseCase(BuildContext context) => const Whitelist();

class Whitelist extends ConsumerWidget {
  const Whitelist({super.key});

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return whitelistWidget(context, ref);
  }
}