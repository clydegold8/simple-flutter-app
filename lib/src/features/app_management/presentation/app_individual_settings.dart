import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'data_traffic_limit.dart';

@WidgetbookUseCase(name: 'App Individual Settings', type: AppIndividualSettings)
Widget appIndividualSettingsUseCase(BuildContext context) =>
    const AppIndividualSettings();

class AppIndividualSettings extends StatefulWidget {
  const AppIndividualSettings({super.key});

  @override
  State<AppIndividualSettings> createState() => _AppIndividualSettingsState();
}

class _AppIndividualSettingsState extends State<AppIndividualSettings> {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual individual settings screen
    return Center(
      child: OutlinedButton(
        onPressed: () => dataTrafficLimitDialogueBuilder(context),
        child: const Text('Setting data usage limits'),
      ),
    );
  }
}
