import 'package:flutter/material.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({
    super.key,
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
            Image.asset('assets/images/rock.png', height: 75, width: 75),
            Image.asset('assets/images/paper.png', height: 75, width: 75),
            Image.asset('assets/images/scissor.png', height: 75, width: 75),
          ],
        ),
      ],
    );
  }
}
