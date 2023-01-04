import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/app_management_list/presentation/app_management_list_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'AppManagementListPage', type: AppManagementList)
Widget appManagementListUseCase(BuildContext context) =>
    const AppManagementList();

class AppManagementList extends ConsumerWidget {
  const AppManagementList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return appManagementListWidget(context, ref);
  }
}
