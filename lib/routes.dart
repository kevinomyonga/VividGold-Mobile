import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/about/about.dart';
import 'package:vividgold_app/ui/account/account.dart';
import 'package:vividgold_app/ui/cart/cart.dart';
import 'package:vividgold_app/ui/cart/checkout.dart';
import 'package:vividgold_app/ui/categories/categories.dart';
import 'package:vividgold_app/ui/favourites/favourites.dart';
import 'package:vividgold_app/ui/intro/intro.dart';
import 'package:vividgold_app/ui/landing.dart';
import 'package:vividgold_app/ui/notifications/notifications.dart';
import 'package:vividgold_app/ui/search/search.dart';
import 'package:vividgold_app/ui/settings/help.dart';
import 'package:vividgold_app/ui/home/home.dart';
import 'package:vividgold_app/ui/products/product_details.dart';
import 'package:vividgold_app/ui/products/products_list.dart';
import 'package:vividgold_app/ui/auth/auth.dart';
import 'package:vividgold_app/ui/orders/order_history.dart';
import 'package:vividgold_app/ui/cart/payment.dart';
import 'package:vividgold_app/ui/settings/settings.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

final routes = <String, WidgetBuilder> {

  //Constants.ROUTE_BASE              : (context) => HomePage(),
  UIConstants.ROUTE_ABOUT             : (context) => AboutPage(),
  /*UIConstants.ROUTE_ACCOUNT           : (context) => AccountPage(),
  UIConstants.ROUTE_AUTH              : (context) => AuthPage(),*/
  UIConstants.ROUTE_CART              : (context) => CartPage(),
  /*UIConstants.ROUTE_CATEGORIES        : (context) => CategoriesPage(),*/
  UIConstants.ROUTE_CHECKOUT          : (context) => CheckoutPage(),
  /*UIConstants.ROUTE_FAVOURITES        : (context) => FavouritesPage(),*/
  UIConstants.ROUTE_HELP              : (context) => HelpPage(),
  UIConstants.ROUTE_HOME              : (context) => LandingPage(),
  UIConstants.ROUTE_ONBOARDING        : (context) => IntroPage(),
  UIConstants.ROUTE_PRODUCT_DETAILS   : (context) => ProductDetailsPage(),
  UIConstants.ROUTE_PRODUCTS          : (context) => ProductsListPage(),
  /*UIConstants.ROUTE_NOTIFICATIONS     : (context) => NotificationsPage(),
  UIConstants.ROUTE_ORDERS            : (context) => OrdersPage(),*/
  UIConstants.ROUTE_PAYMENT           : (context) => PaymentPage(),
  UIConstants.ROUTE_SEARCH            : (context) => SearchPage(),
  UIConstants.ROUTE_SETTINGS          : (context) => SettingsPage(),
};
