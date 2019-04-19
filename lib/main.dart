import 'package:flutter/material.dart';
import 'package:vividgold_app/routes.dart';
import 'package:vividgold_app/ui/intro/intro.dart';
import 'package:vividgold_app/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: Themes.androidTheme(),
      home: IntroPage(),
      routes: routes,
    );
  }
}
