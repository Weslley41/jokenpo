import 'package:flutter/material.dart';

import '../models/jokenpo.dart';

class GameOptions extends StatelessWidget {
  final Function() onTap;
  const GameOptions({
    super.key, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Escolha uma opção para jogar:',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Image.asset(GameOption.rock.imageName, height: 75, width: 75)
            ),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(GameOption.paper.imageName, height: 75, width: 75)
            ),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(GameOption.scissor.imageName, height: 75, width: 75)
            ),
          ],
        ),
      ],
    );
  }
}
