import 'package:flutter/material.dart';

class AboutAppTabPage extends StatelessWidget {

  AboutAppTabPage(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              listType,
              style: Theme.of(context).textTheme.display2,
            ),
          ],
        ),
      ),
    );
  }
}