import 'package:flutter/material.dart';
import 'package:k_block_app/src/features/initial_popup_ios/presentation/initial_popup_ios.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist_widget.dart';

import 'initial_popup_ios_widget.dart';

class InitialPopupIOSState extends State<InitialPopupIOS> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    return initialPopupIOSWidget(context);
  }
}
