import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/account/account.dart';
import 'package:vividgold_app/ui/cart/cart.dart';
import 'package:vividgold_app/ui/cart/checkout.dart';
import 'package:vividgold_app/ui/settings/help.dart';
import 'package:vividgold_app/ui/home/home.dart';
import 'package:vividgold_app/ui/items/item_details.dart';
import 'package:vividgold_app/ui/items/items.dart';
import 'package:vividgold_app/ui/auth/auth.dart';
import 'package:vividgold_app/ui/orders/order_history.dart';
import 'package:vividgold_app/ui/cart/payment.dart';
import 'package:vividgold_app/ui/settings/settings.dart';

final routes = <String, WidgetBuilder> {
  '/'               : (context) => HomePage(),
  '/auth'           : (context) => AuthPage(),
  '/home'           : (context) => HomePage(),
  '/items'          : (context) => ItemsPage(),
  '/item_details'   : (context) => ItemDetailsPage(),
  '/cart'           : (context) => CartPage(),
  '/checkout'       : (context) => CheckoutPage(),
  '/account'        : (context) => AccountPage(),
  '/help'           : (context) => HelpPage(),
  '/orders'         : (context) => OrderHistoryPage(),
  '/payment'        : (context) => PaymentPage(),
  '/settings'       : (context) => SettingsPage(),

  /*'/'               : (BuildContext context) => new HomePage(),
  '/auth'           : (BuildContext context) => AuthPage(),
  '/home'           : (BuildContext context) => HomePage(),
  '/items'          : (BuildContext context) => ItemsPage(),
  '/item_details'   : (BuildContext context) => ItemDetailsPage(),
  '/cart'           : (BuildContext context) => CartPage(),
  '/checkout'       : (BuildContext context) => CheckoutPage(),
  '/account'        : (BuildContext context) => AccountPage(),
  '/help'           : (BuildContext context) => HelpPage(),
  '/orders'         : (BuildContext context) => OrderHistoryPage(),
  '/payment'        : (BuildContext context) => PaymentPage(),
  '/settings'       : (BuildContext context) => SettingsPage(),*/
};
