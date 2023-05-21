import 'package:flutter/material.dart';

import '../models/jokenpo.dart';
import 'option_image.dart';

class GameBattle extends StatelessWidget {
  static final String defaultOption = GameOption.rock.imageName;
  final JokenpoGame? game;
  const GameBattle({super.key, this.game});

  String get playerOption => game?.playerOption.imageName ?? defaultOption;
  String get computerOption => game?.computerOption.imageName ?? defaultOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OptionImage(
          imageName: playerOption, size: 175, angle: 1.57, flipY: true,
        ),
        OptionImage(
          imageName: computerOption, size: 175, angle: -1.57
        ),
      ],
    );
  }
}
