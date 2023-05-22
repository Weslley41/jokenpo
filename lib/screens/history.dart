import 'package:flutter/material.dart';
import 'package:jokenpo/theme.dart';

import '../components/history_button.dart';
import '../models/jokenpo.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
    required this.gameHistory,
  });

  final List<JokenpoGame> gameHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Histórico de partidas',
          style: Theme.of(context).textTheme.headlineSmall
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
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
                  ColorHistoryLabel(color: kWinnerColor, label: 'Vitória'),
                  ColorHistoryLabel(color: kDrawColor, label: 'Empate'),
                  ColorHistoryLabel(color: kLoserColor, label: 'Derrota'),
                ],
              ),
            ),
            ...gameHistory.map((e) => HistoryGame(game: e)).toList()
          ],
        ),
      ),
    );
  }
}

class ColorHistoryLabel extends StatelessWidget {
  const ColorHistoryLabel({
    super.key, required this.color, required this.label,
  });
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20, height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          )
        ),
        const SizedBox(width: 10),
        Text(label, style: kTextColorsLabel),
      ],
    );
  }
}
