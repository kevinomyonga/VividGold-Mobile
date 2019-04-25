import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutStoreTabPage extends StatelessWidget {

  AboutStoreTabPage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSocialMediaLinks(context),
          ],
        ),
      ),
    );
  }

  _buildSocialMediaLinks(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("Facebook button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF3B5998),
              ),
              child: new Icon(
                FontAwesomeIcons.facebookF,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("Instagram button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE4405F),
              ),
              child: new Icon(
                FontAwesomeIcons.instagram,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("LinkedIn button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0077B5),
              ),
              child: new Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("Twitter button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1DA1F2),
              ),
              child: new Icon(
                FontAwesomeIcons.twitter,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () => showInSnackBar("YouTube button pressed"),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFCD201F),
              ),
              child: new Icon(
                FontAwesomeIcons.youtube,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showInSnackBar(String value) {}
}
