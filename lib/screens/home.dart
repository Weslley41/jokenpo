import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jokenpo/components/history_button.dart';

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
  GameOption? _playerOption;
  GameOption? _computerOption;
  String? _resultMessage;
  List _gamedata = [];

  void _setPlayerOption(GameOption option) {
    if (option == _playerOption) return;

    setState(() {
      _playerOption = option;
      _computerOption = _getComputerOption();
      final GameResult result = _playerOption! > _computerOption!;
      _resultMessage = result.message;
      switch (result) {
        case GameResult.win:
          _playerScore++;
          break;
        case GameResult.lose:
          _computerScore++;
          break;
        case GameResult.draw:
          break;
      }
      List temp = [_playerOption, _computerOption, result];
      _gamedata.add(temp);
      temp = [];
    });
  }

  GameOption _getComputerOption() {
    final List<GameOption> options =
        GameOption.values.where((option) => option != _computerOption).toList();
    final int randomValue = Random().nextInt(options.length);

    return options[randomValue];
  }

  void _restartGame() {
    setState(() {
      _playerScore = 0;
      _computerScore = 0;
      _playerOption = null;
      _computerOption = null;
      _resultMessage = null;
      _gamedata = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          actions: [
            HistoryButton(
                playerScore: _playerScore,
                computerScore: _computerScore,
                gameData: _gamedata),
            const RulesButton(),
          ],
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
            Scoreboard(
                playerScore: _playerScore, computerScore: _computerScore),
            if (_playerOption == null)
              const GameBattle()
            else
              GameBattle(
                  playerOption: _playerOption!,
                  computerOption: _computerOption!),
            GameOptions(onTap: _setPlayerOption),
            Text(
              _resultMessage ?? '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
            ),
            _playerOption == null
                ? const SizedBox(height: 48)
                : RestartButton(onPressed: _restartGame),
            const SizedBox(height: 20),
          ],
        ));
  }
}
