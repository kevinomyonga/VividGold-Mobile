import 'package:flutter/material.dart';

class Themes {

  // App Colors
  static Color _primaryColor = Colors.amber;
  static Color _primaryColorDark = Colors.amber.shade700;
  static Color _accentColor = Colors.amberAccent;

  static Color _opposingColor = Colors.black;

  static ThemeData iosTheme() {
    return ThemeData(
      primaryColor: Colors.grey[100],
      primarySwatch: Colors.blue,
      primaryColorBrightness: Brightness.light,
    );
  }

  static ThemeData androidTheme() {
    return ThemeData(
      primaryColor: _primaryColor,
      primaryColorDark: _primaryColorDark,
      accentColor: _accentColor,
      brightness: Brightness.dark,
      fontFamily: 'WorkSans',
    );
  }

  // Gradient
  static Color loginGradientStart = _primaryColor;
  static Color loginGradientEnd = _opposingColor;

  static final primaryGradient = LinearGradient(
    colors: [loginGradientStart, loginGradientEnd],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}
