import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:vividgold_app/routes.dart';
import 'package:vividgold_app/ui/landing.dart';
import 'package:vividgold_app/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => Themes.appTheme(brightness),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            theme: theme,
            home: new LandingPage(),
            routes: routes,
          );
        }
    );
  }
}
