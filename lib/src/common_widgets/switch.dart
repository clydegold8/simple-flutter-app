import 'package:flutter/material.dart';
import 'package:k_block_app/src/constants/colors.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => SwitchState();
}

class SwitchState extends State<SwitchWidget> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Switch(
        value: switchValue,
        activeColor: KBlockColors.activeSwitch,
        onChanged: (bool value) {
          setState(() {
            switchValue = value;
          });
        },
      ),
    );
  }
}
