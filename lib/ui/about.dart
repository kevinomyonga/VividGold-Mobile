import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        title: Text('About'),
      ),

      body: new ListView(
        children: <Widget>[
        ],
      ),
    );
  }
}
