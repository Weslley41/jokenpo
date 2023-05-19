import 'package:flutter/material.dart';

class GameBattle extends StatelessWidget {
  const GameBattle({
    super.key,
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
              'assets/images/scissor.png',
              height: 175, width: 175
            ),
          ),
        ),
        Transform.rotate(
          angle: -1.57,
          child: Image.asset(
            'assets/images/rock.png',
            height: 175, width: 175
          ),
        ),
      ],
    );
  }
}
