import 'package:flutter/material.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist_widget.dart';

import 'add_whitelist.dart';

class AddWhiteListState extends State<AddWhitelist> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    return whitelistWidget(context);
  }
}
