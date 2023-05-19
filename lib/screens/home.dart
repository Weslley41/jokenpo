import 'dart:math';
import 'package:flutter/material.dart';

import '../components/game_battle.dart';
import '../components/game_options.dart';
import '../components/restart_button.dart';
import '../components/rules_button.dart';
import '../components/scoreboard.dart';
import '../models/jokenpo.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _playerScore = 0;
  int _computerScore = 0;
  GameOption _playerOption = GameOption.rock;
  GameOption _computerOption = GameOption.rock;

  void _setPlayerOption(GameOption option) {
    if (option == _playerOption) return;

    setState(() {
      _playerOption = option;
      _computerOption = _getComputerOption();
    });
  }

  GameOption _getComputerOption() {
    final List<GameOption> options = GameOption.values.where(
      (option) => option != _computerOption
    ).toList();
    final int randomValue = Random().nextInt(options.length);

    return options[randomValue];
  }

  void _restartGame() {
    setState(() {
      _playerScore = 0;
      _computerScore = 0;
      _playerOption = GameOption.rock;
      _computerOption = GameOption.rock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          actions: const [RulesButton()],
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Jokenpô',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Scoreboard(playerScore: _playerScore, computerScore: _computerScore),
            GameBattle(playerOption: _playerOption, computerOption: _computerOption),
            GameOptions(onTap: _setPlayerOption),
            RestartButton(onPressed: _restartGame),
            const SizedBox(height: 20),
          ],
        ));
  }
}
