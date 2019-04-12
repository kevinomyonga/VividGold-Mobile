import 'package:flutter/material.dart';
import 'package:vividgold_app/routes.dart';
import 'package:vividgold_app/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: Themes.androidTheme(),
      routes: routes,
      /*onUnknownRoute: (RouteSettings setting) {
        // To can ask the RouterSettings for unknown router name.
        String unknownRoute = setting.name ;
        return new MaterialPageRoute(
            builder: (context) => NotFoundPage()
        );
      },*/
    );
  }
}
