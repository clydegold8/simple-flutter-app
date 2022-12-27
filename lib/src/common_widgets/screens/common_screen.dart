import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/common_widgets/common_menu.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../constants/providers.dart';

@WidgetbookUseCase(name: 'CommonScreen', type: CommonScreen)
Widget commonScreenUseCase(BuildContext context) => const CommonScreen();

class CommonScreen extends ConsumerWidget {
  const CommonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Consumer(
      builder: (context, ref, _) {
        final selectedIndex = ref.watch(widgetPathProvider);

        checkIndex(int selectedIndex){
          if(selectedIndex == 4 || selectedIndex == 5 || selectedIndex == 5){
            return 1;
          }else{
            return selectedIndex;
          }
        }

        int validatedIndex = checkIndex(selectedIndex);
        return Scaffold(
          body: widgetOptions.elementAt(selectedIndex),
          bottomNavigationBar: CommonMenu.generateBottomNavigationBar(
              context, validatedIndex, ref),
        );
      },
    );
  }
}

