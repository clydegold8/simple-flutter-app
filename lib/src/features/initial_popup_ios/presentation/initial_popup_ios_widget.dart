import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'initial_popup_ios_state.dart';

@WidgetbookUseCase(name: 'InitialPopupIOSPage', type: InitialPopupIOS)
Widget initialPopupIOSUseCase(BuildContext context) => const InitialPopupIOS();

class InitialPopupIOS extends StatefulWidget {
  const InitialPopupIOS({super.key});

  @override
  InitialPopupIOSState createState() {
    return InitialPopupIOSState();
  }
}