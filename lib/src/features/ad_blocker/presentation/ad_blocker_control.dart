import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:k_block_app/src/constants/colors.dart';

class AdBlockerControl extends StatefulWidget {
  const AdBlockerControl({super.key});

  @override
  State<AdBlockerControl> createState() => _AdBlockerControlState();
}

class _AdBlockerControlState extends State<AdBlockerControl> {
  bool isAdBlockerOn = false;
  bool isAdBlockerBrowserOnly = true;
  bool isAdBlockerBrowserApp = false;

  void toggleAdBlockerOn() {
    setState(() {
      isAdBlockerOn = !isAdBlockerOn;
    });
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
    final adBlockerButtonShape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    const adBlockerButtonTextStyle = TextStyle(fontSize: 12);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            KBlockColors.adBlockerGradient1,
            KBlockColors.adBlockerGradient2
          ])),
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
              GestureDetector(
                  onTap: toggleAdBlockerOn,
                  child: Image(
                      image: isAdBlockerOn
                          ? const AssetImage('assets/images/ad_blocker_on.png')
                          : const AssetImage(
                              'assets/images/ad_blocker_off.png'))),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                  onPressed:
                      isAdBlockerOn ? onPressedAdBlockerBrowserOnly : null,
                  style: OutlinedButton.styleFrom(
                      disabledForegroundColor:
                          KBlockColors.buttonPositiveBackground,
                      disabledBackgroundColor: Colors.white,
                      foregroundColor: isAdBlockerBrowserOnly
                          ? Colors.white
                          : KBlockColors.buttonAccentForeground,
                      backgroundColor: isAdBlockerBrowserOnly
                          ? KBlockColors.buttonPositiveBackground
                          : KBlockColors.buttonAccentBackground,
                      side: BorderSide(
                          color: !isAdBlockerOn || isAdBlockerBrowserOnly
                              ? KBlockColors.buttonPositiveBackground
                              : Colors.transparent),
                      shape: adBlockerButtonShape),
                  child: Text(
                      AppLocalizations.of(context)?.ad_block_browser_only ??
                          'ブラウザのみで広告ブロック',
                      style: adBlockerButtonTextStyle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: OutlinedButton(
                    onPressed:
                        isAdBlockerOn ? onPressedAdBlockerBrowserApp : null,
                    style: OutlinedButton.styleFrom(
                        disabledForegroundColor:
                            KBlockColors.buttonPositiveBackground,
                        disabledBackgroundColor: Colors.white,
                        foregroundColor: isAdBlockerBrowserApp
                            ? Colors.white
                            : KBlockColors.buttonAccentForeground,
                        backgroundColor: isAdBlockerBrowserApp
                            ? KBlockColors.buttonPositiveBackground
                            : KBlockColors.buttonAccentBackground,
                        side: BorderSide(
                            color: !isAdBlockerOn || isAdBlockerBrowserApp
                                ? KBlockColors.buttonPositiveBackground
                                : Colors.transparent),
                        shape: adBlockerButtonShape),
                    child: Text(
                        AppLocalizations.of(context)?.ad_block_apps_block ??
                            'アプリとブラウザで広告ブロック',
                        style: adBlockerButtonTextStyle)),
              )
            ])),
      ),
    );
  }
}
