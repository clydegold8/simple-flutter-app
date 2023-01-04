// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k_block_app/src/app.dart';
import 'package:k_block_app/src/common_widgets/common_menu.dart';
import 'package:k_block_app/src/common_widgets/screens/block-management-menu.dart';
import 'package:k_block_app/src/common_widgets/screens/common_screen.dart';
import 'package:k_block_app/src/common_widgets/screens/home_screen.dart';
import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/features/ad_blocker/presentation/ad_blocker.dart';
import 'package:k_block_app/src/features/ad_blocker/presentation/ad_blocker_state.dart';
import 'package:k_block_app/src/features/add_whitelist/presentation/add_whitelist.dart';
import 'package:k_block_app/src/features/app_management/presentation/app_individual_settings.dart';
import 'package:k_block_app/src/features/app_management/presentation/data_traffic_limit.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist.dart';
import 'package:k_block_app/src/features/blacklist/presentation/blacklist_widget.dart';
import 'package:k_block_app/src/features/initial_popup_ios/presentation/initial_popup_ios_state.dart';
import 'package:k_block_app/src/features/initial_popup_ios/presentation/initial_popup_ios_widget.dart';
import 'package:k_block_app/src/features/login/presentation/login_form.dart';
import 'package:k_block_app/src/features/login/presentation/login_form_state.dart';
import 'package:k_block_app/src/features/login/presentation/login_form_widget.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist.dart';
import 'package:k_block_app/src/features/whitelist/presentation/whitelist_widget.dart';
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
                WidgetbookFolder(
                  name: 'whitelist',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'Whitelist',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'WhiteListPage',
                              builder: (context) => whiteListUseCase(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'add_whitelist',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'AddWhitelist',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'AddWhiteListPage',
                              builder: (context) =>
                                  addWhiteListUseCase(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'initial_popup_ios',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'InitialPopupIOS',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'InitialPopupIOSPage',
                              builder: (context) =>
                                  initialPopupIOSUseCase(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'ad_blocker',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'AdBlocker',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'AdBlockerPage',
                              builder: (context) =>
                                  addBlockerPageUseCase(context),
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
