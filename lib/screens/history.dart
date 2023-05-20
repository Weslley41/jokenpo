import 'package:flutter/material.dart';

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
          'Histórico das Partidas',
          style: Theme.of(context).textTheme.headlineSmall
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: gameHistory.map((e) => HistoryGame(game: e)).toList(),
        ),
      ),
    );
  }
}
