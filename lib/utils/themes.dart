import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Themes {

  // Theme Data
  static ThemeData appTheme(brightness) {
    return ThemeData(
      primaryColor      : UIConstants.primaryColor,
      primaryColorDark  : UIConstants.primaryColorDark,
      primarySwatch     : UIConstants.primaryColor,
      accentColor       : UIConstants.accentColor,
      brightness        : brightness,
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
