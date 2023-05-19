import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const JokenpoApp());
}

class JokenpoApp extends StatelessWidget {
  const JokenpoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Jokenpô',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
