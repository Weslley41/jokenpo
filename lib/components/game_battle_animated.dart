import 'dart:math';

import 'package:flutter/material.dart';

import '../models/jokenpo.dart';
import 'option_image.dart';

class GameBattleAnimated extends StatefulWidget {
  static final String defaultOption = GameOption.rock.imageName;
  final JokenpoGame? game;
  const GameBattleAnimated({super.key, required this.game});

  @override
  State<GameBattleAnimated> createState() => _GameBattleAnimatedState();
}

class _GameBattleAnimatedState extends State<GameBattleAnimated>
    with TickerProviderStateMixin {
  String get playerOption =>
      widget.game?.playerOption.imageName ?? GameBattleAnimated.defaultOption;

  String get computerOption =>
      widget.game?.computerOption.imageName ?? GameBattleAnimated.defaultOption;

  late AnimationController controller;
  late Animation<double> animationHandLeft;
  late Animation<double> animationHandRight;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));

    animationHandLeft = Tween<double>(
      begin: pi / 18,
      end: -pi / 18,
    ).animate(controller);
    controller.repeat(reverse: true);

    animationHandRight = Tween<double>(
      begin: -pi / 18,
      end: pi / 18,
    ).animate(controller);
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()..rotateZ(animationHandLeft.value),
              child: OptionImage(
                imageName: playerOption,
                size: 175,
                angle: 1.57,
                flipY: true,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()..rotateZ(animationHandRight.value),
              child: OptionImage(
                imageName: computerOption,
                size: 175,
                angle: -1.57,
              ),
            );
          },
        ),
      ],
    );
  }
}
