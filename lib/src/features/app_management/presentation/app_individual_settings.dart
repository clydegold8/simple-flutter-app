import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/features/app_management/presentation/app_individual_settings_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(
    name: 'AppIndividualSettingListPage', type: AppIndividualSetting)
Widget appIndividualSettingUseCase(BuildContext context) =>
    const AppIndividualSetting();

class AppIndividualSetting extends ConsumerWidget {
  const AppIndividualSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return appSettingWidget(context, ref);
  }
}
