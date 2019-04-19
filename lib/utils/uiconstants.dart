import 'package:flutter/material.dart';

class UIConstants {

  // Routes
  static const String ROUTE_BASE            = '/';
  static const String ROUTE_ABOUT           = '/about';
  static const String ROUTE_ACCOUNT         = '/account';
  static const String ROUTE_AUTH            = '/auth';
  static const String ROUTE_CART            = '/cart';
  static const String ROUTE_CATEGORIES      = '/categories';
  static const String ROUTE_CHECKOUT        = '/checkout';
  static const String ROUTE_FAVOURITES      = '/favourites';
  static const String ROUTE_HELP            = '/help';
  static const String ROUTE_HOME            = '/home';
  static const String ROUTE_ONBOARDING      = '/onboarding';
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

  // Search Field Colors
  static Color searchFieldColor             = Colors.white;
  static Color searchPrefixIconColor        = Colors.grey;
  static Color searchFieldHintTextColor     = Colors.grey;
  static Color searchFieldTextColor         = Colors.black;


  //Images
  static const String imageDir      = "assets/images";
  static const String appBarLogo    = "$imageDir/vivid_gold_logo.png";
  static const String loginLogo     = "$imageDir/vividgold_logo.png";
  static const String placeholder   = "$imageDir/placeholder.jpg";

  // Fonts
  static const String workSansFont = 'WorkSans';

  // Strings
  static const String about                   = 'About';
  static const String appName                 = 'VividGold';
  static const String auth_existing           = 'Existing';
  static const String auth_new                = 'New';
  static const String back                    = 'Back';
  static const String cart                    = 'Cart';
  static const String categories              = 'Categories';
  static const String change_password         = 'Change Password';
  static const String checkout                = 'Checkout';
  static const String clear_history           = 'Clear History';
  static const String deactivate_account      = 'Deactivate Account';
  static const String favourites              = 'Favourites';
  static const String forgot_password         = 'Forgot Password?';
  static const String hint_confirm_password   = 'Confirm Password';
  static const String hint_email_address      = 'Email Address';
  static const String hint_name               = 'Name';
  static const String hint_password           = 'Password';
  static const String hint_phone_number       = 'Phone Number';
  static const String home                    = 'Home';
  static const String login                   = 'LOGIN';
  static const String logout                  = 'Logout';
  static const String my_account              = 'My Account';
  static const String my_orders               = 'My Orders';
  static const String notifications           = 'Notifications';
  static const String or                      = 'Or';
  static const String payment                 = 'Payment';
  static const String recent_products         = 'Recent Products';
  static const String search                  = 'Search';
  static const String search_hint1            = 'Search Our Store';
  static const String search_hint2            = 'What are you looking for?';
  static const String settings                = 'Settings';
  static const String sign_up                 = 'SIGN UP';
  static const String tos_agreement           = 'By creating an account you acknowledge that you agree with our Terms Of Service, Privacy Policy and Refund Policy';
}