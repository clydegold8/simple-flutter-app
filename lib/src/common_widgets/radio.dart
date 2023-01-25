import 'package:flutter/material.dart';

import 'package:k_block_app/src/constants/colors.dart';

class RadioOption {
  String value;
  String name;

  RadioOption({required this.value, required this.name});
}

class RadioWidget extends StatefulWidget {
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;
  final Color? selectedColor;

  const RadioWidget(
      {super.key,
      required this.value,
      this.groupValue,
      this.onChanged,
      this.selectedColor = KBlockColors.text02});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () =>
          widget.onChanged != null ? widget.onChanged!(widget.value) : null,
      child: Container(
        margin: const EdgeInsets.only(top: 3, bottom: 3),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: KBlockColors.text02, width: 1)),
        child: Icon(
          Icons.circle,
          size: 8,
          color: selected ? widget.selectedColor : Colors.transparent,
        ),
      ),
    );
  }
}
