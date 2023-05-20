import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'theme.dart';

void main() {
  runApp(const JokenpoApp());
}

class JokenpoApp extends StatelessWidget {
  const JokenpoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpô',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: jokenpoTheme
    );
  }
}
