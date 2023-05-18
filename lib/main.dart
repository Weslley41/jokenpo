import 'package:flutter/material.dart';

import 'components/scoreboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Jokenpô',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Scoreboard(playerScore: 0, computerScore: 0),
          ],
        ),
      ),
    );
  }
}
