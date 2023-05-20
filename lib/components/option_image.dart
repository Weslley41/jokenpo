import 'package:flutter/material.dart';

class OptionImage extends StatelessWidget {
  const OptionImage(
      {super.key,
      required this.imageName,
      this.angle = 0,
      this.flipY = false,
      required this.size});

  final String imageName;
  final double angle, size;
  final bool flipY;

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipY: flipY,
      child: Transform.rotate(
        angle: angle,
        child: Image.asset(
          imageName,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
