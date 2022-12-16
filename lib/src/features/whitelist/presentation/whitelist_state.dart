import 'package:flutter/material.dart';
import 'package:k_block_app/src/features/login/presentation/login_form_widget.dart';

import 'whitelist.dart';

class WhiteListState extends State<Whitelist> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loginFormWidget(context, _formKey);
  }
}
