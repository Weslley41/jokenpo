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
    final Map<String, TextStyle> textStyles = game.textStyles;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HistoryGameItem(
                name: 'Jogador',
                textStyle: textStyles['player']!,
                optionImage: OptionImage(
                  imageName: game.playerOption.imageName, size: 50,
                  angle: 1.57, flipY: true,
                )
              ),
              HistoryGameItem(
                name: 'Computador',
                textStyle: textStyles['computer']!,
                optionImage: OptionImage(
                  imageName: game.computerOption.imageName, size: 50, angle: -1.57,
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryGameItem extends StatelessWidget {
  const HistoryGameItem({
    super.key,
    required this.name,
    required this.optionImage,
    required this.textStyle,
  });

  final String name;
  final OptionImage optionImage;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(name, style: textStyle), optionImage],
    );
  }
}
