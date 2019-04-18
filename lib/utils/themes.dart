import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/constants.dart';

class Themes {

  // Theme Data
  static ThemeData iosTheme() {
    return ThemeData(
      primaryColor: Colors.grey[100],
      primarySwatch: Constants.primaryColor,
      primaryColorBrightness: Brightness.light,
    );
  }

  static ThemeData androidTheme() {
    return ThemeData(
      primaryColor: Constants.primaryColor,
      primaryColorDark: Constants.primaryColorDark,
      accentColor: Constants.accentColor,
      brightness: Brightness.dark,
      fontFamily: Constants.workSansFont,
    );
  }

  // Gradient
  static Color loginGradientStart = Constants.primaryColor;
  static Color loginGradientEnd = Constants.opposingColor;

  static final primaryGradient = LinearGradient(
    colors: [loginGradientStart, loginGradientEnd],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}
