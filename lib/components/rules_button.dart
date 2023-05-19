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
          content: Stack(
            children: [
              Image.asset(
                'assets/images/rules.png',
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
      child: Icon(
        Icons.question_mark,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
