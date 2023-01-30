import 'package:flutter/material.dart';

import 'package:k_block_app/src/constants/colors.dart';

class SimpleDialogueWidget extends StatelessWidget {
  final void Function()? onClickNegativeBtn;
  final void Function()? onClickPositiveBtn;
  final Widget? title;
  final Widget child;
  final MainAxisAlignment? mainAxisAlignmentBtnRow;
  final EdgeInsets? edgeInsetsBtnPadding;
  final String negativeBtnText;
  final String positiveBtnText;
  final bool showNegativeBtn;
  final bool showPositiveBtn;

  const SimpleDialogueWidget(
      {super.key,
      this.onClickNegativeBtn,
      this.onClickPositiveBtn,
      this.title,
      required this.child,
      this.mainAxisAlignmentBtnRow,
      this.edgeInsetsBtnPadding,
      this.negativeBtnText = "",
      this.positiveBtnText = "",
      this.showNegativeBtn = true,
      this.showPositiveBtn = true});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: title,
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 20, 32, 10),
          child: Column(children: [
            child,
            showNegativeBtn || showPositiveBtn
                ? Padding(
                    padding:
                        edgeInsetsBtnPadding ?? const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: showNegativeBtn && showPositiveBtn
                          ? (mainAxisAlignmentBtnRow ??
                              MainAxisAlignment.spaceAround)
                          : MainAxisAlignment.center,
                      children: [
                        showNegativeBtn
                            ? ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minHeight: 43, minWidth: 116),
                                child: OutlinedButton(
                                  onPressed: onClickNegativeBtn,
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          KBlockColors.buttonNeutralForeground,
                                      side: const BorderSide(
                                          color: KBlockColors
                                              .buttonNeutralForeground),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  child: Text(negativeBtnText,
                                      style: const TextStyle(fontSize: 14)),
                                ),
                              )
                            : const SizedBox.shrink(),
                        showPositiveBtn
                            ? ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minHeight: 43, minWidth: 116),
                                child: ButtonTheme(
                                    minWidth: 500.0,
                                    child: OutlinedButton(
                                        onPressed: onClickPositiveBtn,
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Text(positiveBtnText,
                                            style: const TextStyle(
                                                fontSize: 14)))),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  )
                : const SizedBox.shrink()
          ]),
        )
      ],
    );
  }
}
