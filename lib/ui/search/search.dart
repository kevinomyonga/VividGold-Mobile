import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
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
        elevation: 1.0,
        title: Text(UIConstants.search),
      ),

      body: _buildSearchPage(context)
    );
  }

  _buildSearchPage(BuildContext context) {
    return new ListView(
      children: <Widget>[

        new Container(
          color: Theme.of(context).primaryColor,
          child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new TextField(
              //controller: searchController,
              style: TextStyle(
                //fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: UIConstants.searchFieldTextColor
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: UIConstants.searchFieldColor,
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  size: 22.0,
                  color: Colors.grey,
                ),
                hintText: UIConstants.search_hint2,
                hintStyle: TextStyle(
                  color: UIConstants.searchFieldHintTextColor,
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
        new Padding(padding: const EdgeInsets.all(20.0)),

        //grid view
        Container(
          //height: 320.0,
          child: Products(),
        )
      ],
    );
  }
}
