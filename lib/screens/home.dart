import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jokenpo/components/game_battle_animated.dart';
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
  JokenpoGame? _game;
  final List<JokenpoGame> _gameHistory = [];
  String _statusMessage = '';

  void _runGame(GameOption playerOption) {
    if (_game != null && playerOption == _game!.playerOption) {
      return setState(() {
        _statusMessage = 'Jogada inválida!';
      });
    }

    setState(() {
      _game = JokenpoGame(
        playerOption: playerOption,
        computerOption: _getComputerOption(),
      );
      _statusMessage = _game!.result.message;
      switch (_game!.result) {
        case GameResult.win:
          _playerScore++;
          break;
        case GameResult.lose:
          _computerScore++;
          break;
        case GameResult.draw:
          break;
      }
      _gameHistory.insert(0, _game!);
    });
  }

  GameOption _getComputerOption() {
    List<GameOption> options = GameOption.values;
    if (_game != null) {
      options =
          options.where((option) => option != _game!.computerOption).toList();
    }
    final int randomValue = Random().nextInt(options.length);

    return options[randomValue];
  }

  void _restartGame() {
    setState(() {
      _playerScore = 0;
      _computerScore = 0;
      _statusMessage = '';
      _game = null;
      _gameHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _game == null
                ? const SizedBox(height: 48)
                : HistoryButton(gameHistory: _gameHistory),
            const RulesButton(),
          ],
          centerTitle: true,
          elevation: 0,
          title: Text('Jokenpô',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Scoreboard(
                playerScore: _playerScore, computerScore: _computerScore),
            GameBattleAnimated(game: _game),
            Text(_statusMessage,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    )),
            GameOptions(onTap: _runGame),
            _game == null
                ? const SizedBox(height: 48)
                : RestartButton(onPressed: _restartGame),
            const SizedBox(height: 20),
          ],
        ));
  }
}
