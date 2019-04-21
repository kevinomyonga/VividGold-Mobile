import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Themes {

  // Theme Data
  static ThemeData appTheme(brightness) {
    return ThemeData(
      primaryColor      : UIColors.primaryColor,
      primaryColorDark  : UIColors.primaryColorDark,
      primarySwatch     : UIColors.primaryColor,
      accentColor       : UIColors.accentColor,
      brightness        : brightness,
      fontFamily        : UIConstants.workSansFont,
    );
  }

  // Gradient
  static Color loginGradientStart = UIColors.primaryColor;
  static Color loginGradientEnd   = UIColors.opposingColor;

  static final primaryGradient = LinearGradient(
    colors  : [loginGradientStart, loginGradientEnd],
    stops   : [0.0, 1.0],
    begin   : Alignment.topCenter,
    end     : Alignment.bottomCenter,
  );

}
