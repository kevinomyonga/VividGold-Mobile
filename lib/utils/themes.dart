import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Themes {

  // Theme Data
  static ThemeData iosTheme() {
    return ThemeData(
      primaryColor            : Colors.grey[100],
      primarySwatch           : UIConstants.primaryColor,
      primaryColorBrightness  : Brightness.light,
    );
  }

  static ThemeData androidTheme() {
    return ThemeData(
      primaryColor      : UIConstants.primaryColor,
      primaryColorDark  : UIConstants.primaryColorDark,
      primarySwatch     : UIConstants.primaryColor,
      accentColor       : UIConstants.accentColor,
      brightness        : Brightness.dark,
      fontFamily        : UIConstants.workSansFont,
    );
  }

  // Gradient
  static Color loginGradientStart = UIConstants.primaryColor;
  static Color loginGradientEnd   = UIConstants.opposingColor;

  static final primaryGradient = LinearGradient(
    colors  : [loginGradientStart, loginGradientEnd],
    stops   : [0.0, 1.0],
    begin   : Alignment.topCenter,
    end     : Alignment.bottomCenter,
  );

}
