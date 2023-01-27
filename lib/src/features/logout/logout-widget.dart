import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_block_app/src/constants/routes.dart';
import 'package:k_block_app/src/common_widgets/simple_dialogue.dart';

Future<void> logOutWidget(BuildContext context, WidgetRef ref) {
  onCancel() {
    Navigator.pop(context);
  }

  goLogout() {
    Navigator.pushNamed(context, Routes.loginRoute);
  }

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialogueWidget(
          negativeBtnText: AppLocalizations.of(context)?.cancel ?? 'キャンセル',
          positiveBtnText: 'OK',
          onClickNegativeBtn: onCancel,
          onClickPositiveBtn: goLogout,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Center(
                child: Text(
                    AppLocalizations.of(context)?.sure_to_logout ??
                        'ログアウトしてよろしいですか?',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
              ),
            ),
          ));
    },
  );
}
