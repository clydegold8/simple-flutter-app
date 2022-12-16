import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'HomeScreen', type: HomeScreen)
Widget homeScreenUseCase(BuildContext context) => const HomeScreen();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('TODO: Home Screen');
  }
}
