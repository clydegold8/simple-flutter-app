import 'package:flutter/material.dart';
import 'package:k_block_app/src/features/login/presentation/login_form_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'login_form.dart';

@WidgetbookUseCase(name: 'Login Form', type: LoginFormState)
Widget loginForm(BuildContext context) {
  final formKeys = GlobalKey<FormState>();
  return loginFormWidget(context, formKeys);
}

class LoginFormState extends State<KBlockLoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loginFormWidget(context, _formKey);
  }
}
