import 'package:flutter/material.dart';

class Constants {

  // Server URL
  final String serverURL = '';

  // Routes
  static const String ROUTE_BASE            = '/';
  static const String ROUTE_ABOUT           = '/about';
  static const String ROUTE_ACCOUNT         = '/account';
  static const String ROUTE_AUTH            = '/auth';
  static const String ROUTE_CART            = '/cart';
  static const String ROUTE_CATEGORIES      = '/categories';
  static const String ROUTE_CHECKOUT        = '/checkout';
  static const String ROUTE_HELP            = '/help';
  static const String ROUTE_HOME            = '/home';
  static const String ROUTE_PRODUCT_DETAILS = '/product_details';
  static const String ROUTE_PRODUCTS        = '/products';
  static const String ROUTE_NOTIFICATIONS   = '/notifications';
  static const String ROUTE_ORDERS          = '/orders';
  static const String ROUTE_PAYMENT         = '/payment';
  static const String ROUTE_SEARCH          = '/search';
  static const String ROUTE_SETTINGS        = '/settings';

  // App Colors
  static Color primaryColor      = Colors.amber;
  static Color primaryColorDark  = Colors.amber.shade700;
  static Color accentColor       = Colors.amberAccent;
  static Color opposingColor     = Colors.black;
  static Color cartIconColor     = Colors.green.shade500;

  //Images
  static const String imageDir      = "assets/images";
  static const String appBarLogo    = "$imageDir/vivid_gold_logo.png";
  static const String loginLogo     = "$imageDir/vividgold_logo.png";
  static const String placeholder   = "$imageDir/placeholder.jpg";

  // Fonts
  static const String workSansFont = 'WorkSans';

  // Strings
  static const String appName = 'VividGold';
}