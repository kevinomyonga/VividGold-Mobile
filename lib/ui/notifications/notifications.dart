import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsPage extends StatefulWidget {

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: _buildNotificationsPage(context)
    );
  }

  _buildNotificationsPage(BuildContext context) {
    return _buildEmptyView();
  }

  _buildEmptyView() {
    return new Container(
      constraints: const BoxConstraints(maxHeight: 500.0),
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  margin: new EdgeInsets.only(top: 00.0, bottom: 0.0),
                  height: 150.0,
                  width: 150.0,
                  child: new Icon(FontAwesomeIcons.ban)
              ),
              new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Text(
                  "You have no notifications....",
                  style: new TextStyle(fontSize: 14.0,),
                ),
              ),
            ],
          )
      ),
    );
  }
}
