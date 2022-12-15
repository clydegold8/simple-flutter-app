// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/app.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/features/login/presentation/login_form.dart';
import 'package:k_block_app/src/features/login/presentation/login_form_state.dart';
import 'package:k_block_app/src/features/login/presentation/login_form_widget.dart';
import 'package:k_block_app/src/routing/router.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'K-Block App',
      ),
      supportedLocales: locales,
      themes: [
        WidgetbookTheme(
          name: 'Dark',
          data: getDarkTheme(),
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'features',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'login',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'LoginFormState',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Login Form',
                              builder: (context) => loginForm(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
