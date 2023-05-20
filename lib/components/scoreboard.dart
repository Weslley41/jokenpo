import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  final int playerScore, computerScore;
  const Scoreboard({
    super.key, this.playerScore=0, this.computerScore=0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                ScoreboardItem(name: 'Jogador', score: playerScore),
                ScoreboardItem(name: 'Computador', score: computerScore),
              ],
            )
          ],
        ),
      )
    );
  }
}

class ScoreboardItem extends StatelessWidget {
  const ScoreboardItem({
    super.key,
    required this.name,
    required this.score,
  });

  final String name;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall
          ),
          Text(
            '$score',
            style: Theme.of(context).textTheme.headlineLarge
          ),
        ],
      ),
    );
  }
}
