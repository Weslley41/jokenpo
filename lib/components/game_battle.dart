import 'package:flutter/material.dart';

import '../models/jokenpo.dart';
import 'option_image.dart';

class GameBattle extends StatelessWidget {
  final GameOption playerOption, computerOption;
  const GameBattle({
    super.key, this.playerOption=GameOption.rock, this.computerOption=GameOption.rock
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OptionImage(
          imageName: playerOption.imageName, size: 175,
          angle: 1.57, flipY: true,
        ),
        OptionImage(
          imageName: playerOption.imageName, size: 175, angle: -1.57
        ),
      ],
    );
  }
}
