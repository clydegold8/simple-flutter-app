import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter_svg/svg.dart';

import 'package:k_block_app/src/features/ad_blocker/presentation/ad_blocker.dart';

@WidgetbookUseCase(name: 'HomeScreen', type: HomeScreen)
Widget homeScreenUseCase(BuildContext context) => const HomeScreen();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: const AdBlocker(),
    );
  }
}
