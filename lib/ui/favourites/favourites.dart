import 'package:flutter/material.dart';
import 'package:vividgold_app/components/favourites.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: _buildFavouritesPage(context)
    );
  }

  _buildFavouritesPage(BuildContext context) {
    return new ListView(
      children: <Widget>[
        //grid view
        Container(
          child: Favourites(),
        )
      ],
    );
  }
}
