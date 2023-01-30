import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_settings/app_settings.dart';

import 'package:k_block_app/src/constants/colors.dart';
import 'package:k_block_app/src/constants/providers.dart';
import 'package:k_block_app/src/constants/themes.dart';

import 'package:k_block_app/src/common_widgets/simple_dialogue.dart';

class AdBlockerControl extends ConsumerStatefulWidget {
  const AdBlockerControl({super.key});

  @override
  ConsumerState<AdBlockerControl> createState() => _AdBlockerControlState();
}

Future<void> onFirstTimeOn(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        const baseTextStyle = TextStyle(color: KBlockColors.foregroundColor);

        return SimpleDialogueWidget(
            edgeInsetsBtnPadding: const EdgeInsets.only(top: 17),
            onClickNegativeBtn: () {
              Navigator.of(context).pop();
            },
            onClickPositiveBtn: () {
              Navigator.of(context).pop();
              AppSettings.openDeviceSettings();
            },
            negativeBtnText:
                AppLocalizations.of(context)?.dont_allow ?? '許可しない',
            positiveBtnText: AppLocalizations.of(context)?.allow ?? '許可',
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)?.request_vpn_config_title ??
                      '「K-BLOCK」 がVPN構成の追加を\n求めています。',
                  style: baseTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21, bottom: 11),
                  child: Text(
                      AppLocalizations.of(context)?.request_vpn_config_desc ??
                          'K-BLOCKから広告ブロックをするために\nは、VPN構成追加の許可が必要です。',
                      style: baseTextStyle.copyWith(fontSize: 14)),
                )
              ],
            ));
      });
}

class _AdBlockerControlState extends ConsumerState<AdBlockerControl> {
  final offDownImage = SvgPicture.asset(
    'assets/icons/off_down.svg',
  );
  final offRaisedImage = Container(
      width: 58,
      height: 49,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: KBlockColors.offRaisedBoxDropShadow,
                offset: Offset(2, 2)),
            BoxShadow(
                color: KBlockColors.offRaisedBoxInnerShadow,
                offset: Offset(-2, -2))
          ],
          borderRadius: BorderRadius.circular(6),
          color: KBlockColors.offRaisedBoxBackground),
      child: Center(child: SvgPicture.asset('assets/icons/off.svg')));
  final onDownImage = SvgPicture.asset(
    'assets/icons/on_down.svg',
  );
  final onRaisedImage = Container(
    width: 58,
    height: 49,
    decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: KBlockColors.onRaisedBoxDropShadow, offset: Offset(2, 2)),
          BoxShadow(
              color: KBlockColors.onRaisedBoxInnerShadow,
              offset: Offset(-2, -2))
        ],
        borderRadius: BorderRadius.circular(6),
        color: KBlockColors.onRaisedBoxBackground),
    child: Center(child: SvgPicture.asset('assets/icons/on.svg')),
  );
  final powerGrayImage = SvgPicture.asset('assets/icons/power_gray.svg');
  final powerGreenImage = SvgPicture.asset('assets/icons/power_green.svg');
  final powerOrangeImage = SvgPicture.asset('assets/icons/power_orange.svg');
  final toggleOffImage = SvgPicture.asset('assets/icons/toggle_off.svg');
  final toggleOnImage = SvgPicture.asset('assets/icons/toggle_on.svg');

  bool isAdBlockerBrowserOnly = true;
  bool isAdBlockerBrowserApp = false;
  bool isFirstTimeOn = true;

  void onTapAdBlockerSwitch(bool value) {
    setState(() {
      ref.read(adBlockerSwitchStateProvider.notifier).state = value;
    });

    if (value && isFirstTimeOn) {
      onFirstTimeOn(context);
    }
  }

  void onPressedAdBlockerBrowserOnly() {
    setState(() {
      isAdBlockerBrowserOnly = true;
      isAdBlockerBrowserApp = false;
    });
  }

  void onPressedAdBlockerBrowserApp() {
    setState(() {
      isAdBlockerBrowserApp = true;
      isAdBlockerBrowserOnly = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAdBlockerOn = ref.watch(adBlockerSwitchStateProvider);
    final activeTheme = ref.watch(activeThemeNameProvider);
    final activeSwitchButton = ref.watch(activeSwitchButtonProvider);

    final adBlockerButtonShape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    const adBlockerButtonTextStyle = TextStyle(fontSize: 12);

    final Map<String, Widget> switchButtons = {
      'switch': Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => isAdBlockerOn ? onTapAdBlockerSwitch(false) : null,
            child: isAdBlockerOn ? offDownImage : offRaisedImage,
          ),
          GestureDetector(
            onTap: () => isAdBlockerOn ? null : onTapAdBlockerSwitch(true),
            child: isAdBlockerOn ? onRaisedImage : onDownImage,
          )
        ],
      ),
      'toggle': GestureDetector(
          onTap: () => onTapAdBlockerSwitch(!isAdBlockerOn),
          child: isAdBlockerOn ? toggleOnImage : toggleOffImage),
      'circle': Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => isAdBlockerOn ? onTapAdBlockerSwitch(false) : null,
            child: isAdBlockerOn ? powerGrayImage : powerOrangeImage,
          ),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () => isAdBlockerOn ? null : onTapAdBlockerSwitch(true),
            child: isAdBlockerOn ? powerGreenImage : powerGrayImage,
          )
        ],
      )
    };

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: KBlockThemes.linearGradient[activeTheme]!)),
      child: FractionallySizedBox(
        heightFactor: 0.85,
        widthFactor: 0.75,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: KBlockColors.boxShadow,
                    blurRadius: 6,
                    offset: Offset(0, 3))
              ],
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 180,
                child: Stack(alignment: Alignment.center, children: [
                  Center(
                      child: SvgPicture.asset(
                          'assets/icons/ad_blocker_switch_bg.svg')),
                  switchButtons[activeSwitchButton]!,
                ]),
              ),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: OutlinedButton(
                        onPressed: isAdBlockerOn
                            ? onPressedAdBlockerBrowserOnly
                            : null,
                        style: OutlinedButton.styleFrom(
                            disabledForegroundColor:
                                Theme.of(context).colorScheme.secondary,
                            disabledBackgroundColor: Colors.white,
                            foregroundColor: isAdBlockerBrowserOnly
                                ? Colors.white
                                : Theme.of(context).colorScheme.tertiary,
                            backgroundColor: isAdBlockerBrowserOnly
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                            side: BorderSide(
                                color: !isAdBlockerOn || isAdBlockerBrowserOnly
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.transparent),
                            shape: adBlockerButtonShape),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13, bottom: 13),
                          child: Text(
                              AppLocalizations.of(context)
                                      ?.ad_block_browser_only ??
                                  'ブラウザのみで広告ブロック',
                              style: adBlockerButtonTextStyle),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: OutlinedButton(
                          onPressed: isAdBlockerOn
                              ? onPressedAdBlockerBrowserApp
                              : null,
                          style: OutlinedButton.styleFrom(
                              disabledForegroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              disabledBackgroundColor: Colors.white,
                              foregroundColor: isAdBlockerBrowserApp
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.tertiary,
                              backgroundColor: isAdBlockerBrowserApp
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                              side: BorderSide(
                                  color: !isAdBlockerOn || isAdBlockerBrowserApp
                                      ? Theme.of(context).colorScheme.secondary
                                      : Colors.transparent),
                              shape: adBlockerButtonShape),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13, bottom: 13),
                            child: Text(
                                AppLocalizations.of(context)
                                        ?.ad_block_apps_block ??
                                    'アプリとブラウザで広告ブロック',
                                style: adBlockerButtonTextStyle),
                          )),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
