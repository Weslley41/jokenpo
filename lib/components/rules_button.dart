import 'package:flutter/material.dart';

class RulesButton extends StatelessWidget {
  static const List<String> rules = [
    '🖐️ O papel vence a pedra.',
    '✊ A pedra vence a tesoura.',
    '✌️ A tesoura vence o papel.',
  ];
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
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/rules.png', height: 200),
                Text(
                  '(A direção da seta indica quem vence)',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                ...rules.map((rule) => SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    rule, style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )),
                const SizedBox(height: 10),
                Text(
                  'Não é permitido mostrar o mesmo gesto duas vezes seguidas.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'Voltar'),
                child: Text(
                  'Voltar',
                  style: Theme.of(context).textTheme.titleLarge,
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
