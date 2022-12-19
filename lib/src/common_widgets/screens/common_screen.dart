import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'package:k_block_app/src/common_widgets/common_menu.dart';

@WidgetbookUseCase(name: 'CommonScreen', type: CommonScreen)
Widget commonScreenUseCase(BuildContext context) => const CommonScreen();

class CommonScreen extends StatefulWidget {
  const CommonScreen({super.key});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CommonMenu.generateBottomNavigationBar(
          context, _selectedIndex, _onItemTapped),
    );
  }
}
