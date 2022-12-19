import 'package:flutter/material.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist_widget.dart';

import 'whitelist.dart';

class WhiteListState extends State<Whitelist> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    return whitelistWidget(context);
  }
}
