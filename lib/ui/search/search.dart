import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

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

  _buildSearchField(BuildContext context) {
    return new Container(
      color: UIColors.primaryColor,
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new TextField(
          //controller: searchController,
          style: TextStyle(
            //fontFamily: "WorkSansSemiBold",
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: UIColors.searchFieldTextColor
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: UIColors.searchFieldColor,
            prefixIcon: Icon(
              FontAwesomeIcons.search,
              size: 22.0,
              color: UIColors.searchPrefixIconColor,
            ),
            hintText: UIConstants.search_hint2,
            hintStyle: TextStyle(
              color: UIColors.searchFieldHintTextColor,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
      ),
    );
  }

  _buildSearchPage(BuildContext context) {
    return new ListView(
      children: <Widget>[

        _buildSearchField(context),

        //grid view
        Container(
          //height: 320.0,
          child: Products(),
        )
      ],
    );
  }
}
