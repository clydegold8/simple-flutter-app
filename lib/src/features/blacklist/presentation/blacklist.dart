import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'blacklist_state.dart';

@WidgetbookUseCase(name: 'BlackListPage', type: BlackList)
Widget blackListUseCase(BuildContext context) => const BlackList();

class BlackList extends StatefulWidget {
  const BlackList({super.key});

  @override
  BlackListState createState() {
    return BlackListState();
  }
}
