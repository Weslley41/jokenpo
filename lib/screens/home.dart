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
  List _gameData = [];
  String? _statusMessage;

  void _setPlayerOption(GameOption option) {
    if (option == _playerOption) {
      return setState(() {
        _statusMessage = 'Jogada inválida!';
      });
    }

    setState(() {
      _playerOption = option;
      _computerOption = _getComputerOption();
      final GameResult result = _playerOption! > _computerOption!;
      _statusMessage = result.message;
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
      _gameData.add(temp);
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
      _statusMessage = null;
      _gameData = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            HistoryButton(
                playerScore: _playerScore,
                computerScore: _computerScore,
                gameData: _gameData),
            const RulesButton(),
          ],
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Jokenpô',
            style: Theme.of(context).textTheme.headlineMedium
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Scoreboard(playerScore: _playerScore, computerScore: _computerScore),
            if (_playerOption == null) const GameBattle()
            else GameBattle(playerOption: _playerOption!, computerOption: _computerOption!),
            Text(
              _statusMessage ?? '',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
              )
            ),
            GameOptions(onTap: _setPlayerOption),
            _playerOption == null ? const SizedBox(height: 48) : RestartButton(onPressed: _restartGame),
            const SizedBox(height: 20),
          ],
        ));
  }
}
