import 'package:flutter/material.dart';

class UIColors {

  // Store Color
  static Color brandColor      = Colors.amber;

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

  // Social Media
  static Color facebookColor  = Color(0xFF3B5998);
  static Color instagramColor = Color(0xFFE4405F);
  static Color linkedInColor  = Color(0xFF0077B5);
  static Color twitterColor   = Color(0xFF1DA1F2);
  static Color whatsappColor  = Color(0xFF25D366);
  static Color youtubeColor   = Color(0xFFCD201F);

}
