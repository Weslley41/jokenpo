import 'package:flutter/material.dart';

final jokenpoTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    secondary: const Color.fromARGB(255, 48, 53, 53),
    tertiary: const Color.fromARGB(255, 148, 161, 135),
    background: const Color.fromARGB(255, 148, 161, 135),
    surface: const Color.fromARGB(255, 48, 53, 53),
    onSurface: Colors.white,
  ),
);
