import 'package:flutter/material.dart';

import '../models/jokenpo.dart';

class GameBattle extends StatelessWidget {
  final GameOption playerOption, computerOption;
  const GameBattle({
    super.key, required this.playerOption, required this.computerOption
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.flip(
          flipY: true,
          child: Transform.rotate(
            angle: 1.57,
            child: Image.asset(
              playerOption.imageName,
              height: 175, width: 175
            ),
          ),
        ),
        Transform.rotate(
          angle: -1.57,
          child: Image.asset(
            computerOption.imageName,
            height: 175, width: 175
          ),
        ),
      ],
    );
  }
}
