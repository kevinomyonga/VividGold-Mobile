import 'package:flutter/material.dart';

class UIColors {

  // App Colors
  static Color primaryColor      = Colors.amber;
  static Color primaryColorDark  = Colors.amber.shade700;
  static Color accentColor       = Colors.amberAccent;
  static Color opposingColor     = Colors.black;

  // Cart Icon
  static Color cartIconColor          = Colors.green.shade500;
  static Color cartItemPriceColor     = Colors.red.shade900;

  // Tabs Colors
  static Color tabsLabelLightThemeColor  = Colors.black87;
  static Color tabsLabelDarkThemeColor  = Colors.white;
  static Color tabsUnselectedLabelColor  = Colors.grey;

  static tabsLabelThemeColor(context) {
    return Theme.of(context).brightness == Brightness.dark ?
    tabsLabelDarkThemeColor: tabsLabelLightThemeColor;
  }

  // Search Field Colors
  //static Color searchFieldColor             = Colors.white;
  static Color searchPrefixIconColor        = Colors.grey;
  static Color searchFieldHintTextColor     = Colors.grey;
  //static Color searchFieldTextColor         = Colors.black;

  // Show More Or Less
  static Color showMoreLessColor  = Colors.blue;
}
