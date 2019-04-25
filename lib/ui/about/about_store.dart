import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/widgets/description_text.dart';

class AboutStoreTabPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AboutStoreTabPageState();
}

class AboutStoreTabPageState extends State<AboutStoreTabPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 50.0,
            ),
            _buildStoreDescInfo(context),
            _buildSocialMediaLinks(context),
          ],
        ),
      ),
      /*body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildStoreDescInfo(context),
            _buildSocialMediaLinks(context),
          ],
        ),
      ),*/
    );
  }

  _buildStoreDescInfo(context) {

    String description = UIConstants.store_desc;

    return new Container(
      margin: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new DescriptionTextWidget(text: description),
        ],
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
