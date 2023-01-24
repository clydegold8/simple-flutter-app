import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final Widget icon;
  final double size;
  final Gradient gradient;

  const GradientIcon(
      {super.key,
      required this.icon,
      required this.size,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: icon,
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
