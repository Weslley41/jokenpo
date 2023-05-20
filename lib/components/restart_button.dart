import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final void Function() onPressed;
  const RestartButton({
    super.key, required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          fixedSize: const Size(300, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reiniciar o jogo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 8),
            const Icon(Icons.refresh),
          ],
        ));
  }
}
