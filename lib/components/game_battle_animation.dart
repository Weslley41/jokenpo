import 'dart:math';
import 'package:flutter/material.dart';

import '../models/jokenpo.dart';
import 'option_image.dart';

class GameBattleAnimation extends StatefulWidget {
  const GameBattleAnimation({super.key});

  @override
  State<GameBattleAnimation> createState() => _GameBattleAnimationState();
}

class _GameBattleAnimationState extends State<GameBattleAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationHandLeft;
  late Animation<double> animationHandRight;
  final String defaultOption = GameOption.rock.imageName;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));

    animationHandLeft = Tween<double>(
      begin: 0,
      end: -pi / 18,
    ).animate(controller);

    animationHandRight = Tween<double>(
      begin: 0,
      end: pi / 18,
    ).animate(controller);

    _runAnimation();
  }

  void _runAnimation() {
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.stop();
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
                imageName: defaultOption,
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
                imageName: defaultOption,
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
