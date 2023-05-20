import 'package:flutter/material.dart';

import '../models/jokenpo.dart';
import '../screens/history.dart';
import 'option_image.dart';

class HistoryButton extends StatelessWidget {
  final List<JokenpoGame> gameHistory;

  const HistoryButton({
    required this.gameHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => HistoryPage(gameHistory: gameHistory),
        ));
      },
      child: const Icon(Icons.leaderboard),
    );
  }
}

class HistoryGame extends StatelessWidget {
  final JokenpoGame game;
  const HistoryGame({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HistoryGameItem(
              name: 'Jogador',
              optionImage: OptionImage(
                imageName: game.playerOption.imageName, size: 50,
                angle: 1.57, flipY: true,
              )
            ),
            HistoryGameItem(
              name: 'Computador',
              optionImage: OptionImage(
                imageName: game.playerOption.imageName, size: 50, angle: -1.57,
              )
            ),
          ],
        ),
      ],
    );
  }
}

class HistoryGameItem extends StatelessWidget {
  const HistoryGameItem({
    super.key, required this.name, required this.optionImage,
  });

  final String name;
  final OptionImage optionImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        optionImage
      ],
    );
  }
}
