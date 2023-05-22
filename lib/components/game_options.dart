import 'package:flutter/material.dart';

import '../models/jokenpo.dart';

class GameOptions extends StatefulWidget {
  final void Function(GameOption option) onTap;
  const GameOptions({super.key, required this.onTap});

  @override
  State<GameOptions> createState() => _GameOptionsState();
}

class _GameOptionsState extends State<GameOptions> {
  bool _isClickable = true;

  void _onTap(GameOption option) {
    if (!_isClickable) return;

    widget.onTap(option);
    setState(() {
      _isClickable = false;
    });

    Future.delayed(const Duration(milliseconds: 1250), () {
      try {
        setState(() {
          _isClickable = true;
        });
      } catch (e) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Escolha uma opção para jogar:',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => _onTap(GameOption.rock),
                child: Image.asset(GameOption.rock.imageName,
                    height: 75, width: 75)),
            GestureDetector(
                onTap: () => _onTap(GameOption.paper),
                child: Image.asset(GameOption.paper.imageName,
                    height: 75, width: 75)),
            GestureDetector(
                onTap: () => _onTap(GameOption.scissor),
                child: Image.asset(GameOption.scissor.imageName,
                    height: 75, width: 75)),
          ],
        ),
      ],
    );
  }
}
