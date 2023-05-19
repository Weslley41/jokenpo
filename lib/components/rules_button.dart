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
                color: Colors.blue.shade800,
                'assets/images/three_arrow_rotation.png',
              ),
              Positioned(
                right: 25,
                bottom: 155,
                child: Transform.rotate(
                  angle: -0.25,
                  child: Image.asset(
                    'assets/images/rock.png',
                    height: 125,
                    width: 125,
                  ),
                ),
              ),
              Positioned(
                right: 170,
                top: 85,
                child: Transform.rotate(
                  angle: -0.25,
                  child: Image.asset(
                    'assets/images/paper.png',
                    height: 125,
                    width: 125,
                  ),
                ),
              ),
              Positioned(
                right: 23,
                bottom: 0.1,
                child: Transform.rotate(
                  angle: -0.25,
                  child: Image.asset(
                    'assets/images/scissor.png',
                    height: 125,
                    width: 125,
                  ),
                ),
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
      child: Text(
        'Regras',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).secondaryHeaderColor,
            ),
      ),
    );
  }
}
