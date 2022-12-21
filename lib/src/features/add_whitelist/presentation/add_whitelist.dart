import 'package:flutter/material.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist_state.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'AddWhiteListPage', type: AddWhitelist)
Widget addWhiteListUseCase(BuildContext context) => const AddWhitelist();

class AddWhitelist extends StatefulWidget {
  const AddWhitelist({super.key});

  @override
  AddWhiteListState createState() {
    return AddWhiteListState();
  }
}