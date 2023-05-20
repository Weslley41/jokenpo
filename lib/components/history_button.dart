import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  final List gameData;
  final int playerScore;
  final int computerScore;

  const HistoryButton({
    required this.gameData,
    required this.playerScore,
    required this.computerScore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        debugPrint(gameData.toString() +
            playerScore.toString() +
            computerScore.toString());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                actions: const [],
                centerTitle: true,
                elevation: 0,
                title: Text(
                  'Histórico das Partidas',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall
                ),
              ),
              body: Table(
                border: TableBorder.all(),
              ),
            ),
          ),
        );
      },
      child: const Icon(Icons.leaderboard),
    );
  }
}
