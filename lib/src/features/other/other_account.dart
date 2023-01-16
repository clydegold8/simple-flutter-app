import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../constants/providers.dart';
import 'other_account_widget.dart';

@WidgetbookUseCase(name: 'OtherAccountPage', type: OtherAccount)
Widget otherAccountUseCase(BuildContext context) => const OtherAccount();

class OtherAccount extends ConsumerStatefulWidget {
  const OtherAccount({super.key});

  @override
  OtherAccountState createState() => OtherAccountState();
}

class OtherAccountState extends ConsumerState<OtherAccount> {

  @override
  void initState() {
    super.initState();
    ref.read(widgetPathProvider);
  }


  @override
  Widget build(BuildContext context) {
    return otherAccountWidget(context, ref);
  }

}