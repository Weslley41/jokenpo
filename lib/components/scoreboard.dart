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
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Jogador',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                        )
                      ),
                      Text(
                        '$playerScore',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Computador',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                        )
                      ),
                      Text(
                        '$computerScore',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
