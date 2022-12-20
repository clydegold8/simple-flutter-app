import 'package:flutter/material.dart';

import 'data_traffic_limit.dart';

class AppIndividualSettings extends StatefulWidget {
  const AppIndividualSettings({super.key});

  @override
  State<AppIndividualSettings> createState() => _AppIndividualSettingsState();
}

class _AppIndividualSettingsState extends State<AppIndividualSettings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () => dataTrafficLimitDialogueBuilder(context),
        child: const Text('Setting data usage limits'),
      ),
    );
  }
}
