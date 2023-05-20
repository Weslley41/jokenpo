import 'package:flutter/material.dart';

class RulesButton extends StatelessWidget {
  const RulesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Regras do Jogo',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/rules.png',
              ),
              Text(
                '(A direção da seta indica quem vence)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'A tesoura(✌️) corta o papel(🖐️), mas quebra com a pedra(👊).\nO papel(🖐️) embrulha a pedra(👊), mas é cortado pela tesoura(✌️).\nA pedra(👊) quebra a tesoura(✌️), mas é embrulhada pelo papel(🖐️).',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300, height: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Não é permitido mostrar o mesmo gesto duas vezes seguidas.',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: Text(
                  'Voltar', style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.question_mark),
    );
  }
}
