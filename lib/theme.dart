import 'package:flutter/material.dart';

final jokenpoTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    secondary: Colors.blue.shade600,
    tertiary: Colors.blue.shade400,
    background: Colors.blue.shade400,
    surface: Colors.blue.shade600,
    onSurface: Colors.white,
  ),
);
