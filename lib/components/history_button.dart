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
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              actions: const [],
              centerTitle: true,
              elevation: 0,
              title: Text('Histórico das Partidas',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            body: GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              children: gameData.map((e) => RowGrid(data: e)).toList(),
            ),
          ),
        ));
      },
      child: const Icon(Icons.leaderboard),
    );
  }
}

//gameData.map((e) => RowGrid(rowList: e)

class RowGrid extends StatelessWidget {
  final List data;
  const RowGrid({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Sua Jogada',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Jogada do Computador',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Resultado',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.rotate(
              angle: 1.57,
              child: Image.asset(
                data[0].imageName,
                width: 50,
                height: 50,
              ),
            ),
            Transform.rotate(
              angle: -1.57,
              child: Image.asset(
                data[1].imageName,
                width: 50,
                height: 50,
              ),
            ),
            Text(
              data[2].message,
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ],
    );
  }
}
