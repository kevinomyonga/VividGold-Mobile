import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        title: Text('Notifications'),
      ),

      body: new ListView(
        children: <Widget>[

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('You Have No Notifications. Come Back Later'),),
        ],
      ),
    );
  }
}
