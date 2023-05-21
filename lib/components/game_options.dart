import 'package:flutter/material.dart';

import '../models/jokenpo.dart';

class GameOptions extends StatelessWidget {
  final void Function(GameOption option) onTap;
  const GameOptions({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Escolha uma opção para jogar:',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => onTap(GameOption.rock),
                child: Image.asset(GameOption.rock.imageName,
                    height: 75, width: 75)),
            GestureDetector(
                onTap: () => onTap(GameOption.paper),
                child: Image.asset(GameOption.paper.imageName,
                    height: 75, width: 75)),
            GestureDetector(
                onTap: () => onTap(GameOption.scissor),
                child: Image.asset(GameOption.scissor.imageName,
                    height: 75, width: 75)),
          ],
        ),
      ],
    );
  }
}
