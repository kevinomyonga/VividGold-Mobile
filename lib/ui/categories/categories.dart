import 'package:flutter/material.dart';
import 'package:vividgold_app/components/products.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: _buildCategoriesPage(context)
    );
  }

  _buildCategoriesPage(BuildContext context) {
    return new ListView(
      children: <Widget>[
        //grid view
        Container(
          //height: 320.0,
          child: Products(),
        )
      ],
    );
  }
}
