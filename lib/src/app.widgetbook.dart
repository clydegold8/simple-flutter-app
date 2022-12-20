// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/app.dart';
import 'package:k_block_app/src/common_widgets/common_menu.dart';
import 'package:k_block_app/src/common_widgets/screens/block-management-menu.dart';
import 'package:k_block_app/src/common_widgets/screens/common_screen.dart';
import 'package:k_block_app/src/common_widgets/screens/home_screen.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/features/app_management/presentation/app_individual_settings.dart';
import 'package:k_block_app/src/features/app_management/presentation/data_traffic_limit.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist.dart';
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
      localizationsDelegates: localizationsDelegates,
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
                  name: 'blacklist',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'BlackList',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'BlackListPage',
                              builder: (context) => blackListUseCase(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'app_management',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'AppIndividualSettings',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'App Individual Settings',
                              builder: (context) =>
                                  appIndividualSettingsUseCase(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
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
            WidgetbookFolder(
              name: 'common_widgets',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'screens',
                  widgets: [
                    WidgetbookComponent(
                      name: 'CommonScreen',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'CommonScreen',
                          builder: (context) => commonScreenUseCase(context),
                        ),
                      ],
                    ),
                    WidgetbookComponent(
                      name: 'HomeScreen',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'HomeScreen',
                          builder: (context) => homeScreenUseCase(context),
                        ),
                      ],
                    ),
                    WidgetbookComponent(
                      name: 'BlockManagementMenu',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'BlockManagementMenu',
                          builder: (context) => blockManagementUseCase(context),
                        ),
                      ],
                    ),
                  ],
                  folders: [],
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
