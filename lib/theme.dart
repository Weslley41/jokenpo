import 'package:flutter/material.dart';

final jokenpoTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Exo',
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    secondary: const Color.fromARGB(255, 48, 53, 53),
    tertiary: const Color.fromARGB(255, 148, 161, 135),
    background: const Color.fromARGB(255, 148, 161, 135),
    surface: const Color.fromARGB(255, 48, 53, 53),
    onSurface: Colors.white,
  ),
);

final Color kWinnerColor = Colors.green.shade900;
final Color kLoserColor = jokenpoTheme.colorScheme.tertiary;
final Color kDrawColor = Colors.grey.shade600;

final TextStyle kTextWinner = TextStyle(
  color: kWinnerColor,
  fontSize: 20,
  fontWeight: FontWeight.bold
);
final TextStyle kTextLoser = TextStyle(
  color: kLoserColor,
  fontSize: 20,
  fontWeight: FontWeight.bold
);
final TextStyle kTextDraw = TextStyle(
  color: kDrawColor,
  fontSize: 20,
  fontWeight: FontWeight.bold
);
final TextStyle kTextColorsLabel = TextStyle(
  color: jokenpoTheme.colorScheme.secondary,
);
