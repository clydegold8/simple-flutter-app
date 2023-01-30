import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final bool switchValue;
  final Function updateValue;
  final int index;
  const SwitchWidget(
      {Key? key,
      required this.switchValue,
      required this.index,
      required this.updateValue})
      : super(key: key);

  @override
  State<SwitchWidget> createState() => SwitchState();
}

class SwitchState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Switch(
        value: widget.switchValue,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (bool value) {
          widget.updateValue(widget.index, value);
        },
      ),
    );
  }
}
