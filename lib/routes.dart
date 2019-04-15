import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/about.dart';
import 'package:vividgold_app/ui/account/account.dart';
import 'package:vividgold_app/ui/cart/cart.dart';
import 'package:vividgold_app/ui/cart/checkout.dart';
import 'package:vividgold_app/ui/notifications.dart';
import 'package:vividgold_app/ui/search.dart';
import 'package:vividgold_app/ui/settings/help.dart';
import 'package:vividgold_app/ui/home/home.dart';
import 'package:vividgold_app/ui/products/product_details.dart';
import 'package:vividgold_app/ui/products/products_list.dart';
import 'package:vividgold_app/ui/auth/auth.dart';
import 'package:vividgold_app/ui/orders/order_history.dart';
import 'package:vividgold_app/ui/cart/payment.dart';
import 'package:vividgold_app/ui/settings/settings.dart';
import 'package:vividgold_app/utils/constants.dart';

final routes = <String, WidgetBuilder> {

  Constants.ROUTE_BASE              : (context) => HomePage(),
  Constants.ROUTE_ABOUT             : (context) => AboutPage(),
  Constants.ROUTE_ACCOUNT           : (context) => AccountPage(),
  Constants.ROUTE_AUTH              : (context) => AuthPage(),
  Constants.ROUTE_CART              : (context) => CartPage(),
  Constants.ROUTE_CHECKOUT          : (context) => CheckoutPage(),
  Constants.ROUTE_HELP              : (context) => HelpPage(),
  Constants.ROUTE_HOME              : (context) => HomePage(),
  Constants.ROUTE_PRODUCT_DETAILS   : (context) => ProductDetailsPage(),
  Constants.ROUTE_PRODUCTS          : (context) => ProductsListPage(),
  Constants.ROUTE_NOTIFICATIONS     : (context) => NotificationsPage(),
  Constants.ROUTE_ORDERS            : (context) => OrderHistoryPage(),
  Constants.ROUTE_PAYMENT           : (context) => PaymentPage(),
  Constants.ROUTE_SEARCH            : (context) => SearchPage(),
  Constants.ROUTE_SETTINGS          : (context) => SettingsPage(),

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
