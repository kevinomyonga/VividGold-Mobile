import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/horizontal_listview.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/utils/themes.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: _buildHomePage(context)
    );
  }

  _buildHomePage(BuildContext context) {

    return new ListView(
      children: <Widget>[
        //image carousel begins here
        _buildImageCarousel(context),

        new Container(
          color: Theme.of(context).primaryColor,
          child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new InkWell(
              onTap: (){
                Navigator.pushNamed(context, UIConstants.ROUTE_SEARCH);
              },
              child: new TextField(
                enabled: false,
                //controller: searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: UIConstants.searchFieldColor,
                  prefixIcon: Icon(
                    FontAwesomeIcons.search,
                    size: 22.0,
                    color: UIConstants.searchPrefixIconColor,
                  ),
                  hintText: UIConstants.search_hint1,
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
        ),

        //padding widget
        new Padding(padding: const EdgeInsets.all(20.0),
          child: new Text(
              UIConstants.categories,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              )
          ),
        ),

        //Horizontal list view begins here
        HorizontalList(),

        Divider(),

        //padding widget
        new Padding(padding: const EdgeInsets.all(20.0),
          child: new Text(
              UIConstants.recent_products,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              )
          ),
        ),

        //grid view
        Container(
          //height: 320.0,
          child: Products(),
        )
      ],
    );
  }

  _buildImageCarousel(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/04/days-gone.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/03/apex-legends.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/03/mortal-kombat-11.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/03/fifa-ultimate-team.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/01/game-pass.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/01/gaming-kenya.jpg'),
        ],
        autoplay: true,
        autoplayDuration: Duration(milliseconds: 5000),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 7.0,
      ),
    );

    return imageCarousel;
  }
}
