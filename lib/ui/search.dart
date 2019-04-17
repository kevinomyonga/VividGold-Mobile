import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/themes.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        //backgroundColor: Colors.red,
        title: Text('Search'),
      ),

      body: _buildSearchPage(context)
    );
  }

  _buildSearchPage(BuildContext context) {
    return new ListView(
      children: <Widget>[

        new Container(
          //color: Theme.of(context).primaryColor,
          decoration: new BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Themes.loginGradientStart,
                offset: Offset(1.0, 6.0),
                blurRadius: 20.0,
              ),
              BoxShadow(
                color: Themes.loginGradientEnd,
                offset: Offset(1.0, 6.0),
                blurRadius: 20.0,
              ),
            ],
            gradient: new LinearGradient(
                colors: [
                  Themes.loginGradientEnd,
                  Themes.loginGradientStart
                ],
                begin: const FractionalOffset(0.2, 0.2),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new TextField(
              //controller: searchController,
              style: TextStyle(
                //fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  size: 22.0,
                  color: Colors.grey,
                ),
                hintText: 'What are you looking for?',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
        ),

        //padding widget
        new Padding(padding: const EdgeInsets.all(20.0),
          child: new Text('Recent products'),),

        //grid view
        Container(
          //height: 320.0,
          child: Products(),
        )
      ],
    );
  }
}
