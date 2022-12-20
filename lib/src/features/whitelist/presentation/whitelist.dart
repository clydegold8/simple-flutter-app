import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'whitelist_state.dart';

@WidgetbookUseCase(name: 'WhiteListPage', type: Whitelist)
Widget whiteListUseCase(BuildContext context) => const Whitelist();

class Whitelist extends StatefulWidget {
  const Whitelist({super.key});

  @override
  WhiteListState createState() {
    return WhiteListState();
  }
}