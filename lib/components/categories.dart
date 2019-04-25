import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var categoriesList = [
    {
      "name": "Playstation",
      "picture": "https://pbs.twimg.com/media/D2hQseeXQAc8BxD.jpg",
    },
    {
      "name": "XBOX",
      "picture": "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/1024px-Xbox_one_logo.svg.png",
    },
    {
      "name": "Nintendo",
      "picture": "https://upload.wikimedia.org/wikipedia/commons/9/95/Nintendo_Logo_2017.png",
    },
    {
      "name": "PC",
      "picture": "http://www.sclance.com/pngs/pc-logo-png/pc_logo_png_996767.png",
    },
    {
      "name": "Pre Order",
      "picture": "http://www.dutyfree.ca/application/files/3114/8597/6357/preorder.png",
    },
    {
      "name": "Trade In",
      "picture": "http://www.pngmart.com/files/7/Trade-PNG-Transparent.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return /*new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: ScrollPhysics(), // to disable GridView's scrolling
      crossAxisCount: 4,
      itemCount: categoriesList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildCategoryItemCard(context, categoriesList[index]);
      },
      staggeredTileBuilder: (int index) =>
      //new StaggeredTile.count(2, index.isEven ? 2 : 1),
      new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );*/

      GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(), // to disable GridView's scrolling
          itemCount: categoriesList.length,
          gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return _buildCategoryItemCard(context, categoriesList[index]);
          });
  }

  _buildCategoryItemCard(BuildContext context, var product) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCTS);
      },
      child: Card(
        elevation: 4.0,

        child: new Stack(
            children: <Widget>[
              Container(
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage(UIConstants.placeholder),
                  image: NetworkImage(product['picture'],),
                ),
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width / 2.0,
              ),

              Container(
                width: MediaQuery.of(context).size.width / 2.0,
                /*decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: NetworkImage("https://avatarfiles.alphacoders.com/149/149117.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),*/
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: new Container(
                    decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  ),
                ),
              ),

              new Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        product['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              )
            ]
        ),

        /*child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              *//*child: Image.network(
                product['picture'],
                fit: BoxFit.fitWidth,
              ),*//*
              child: FadeInImage(
                fit: BoxFit.fitWidth,
                placeholder: AssetImage(UIConstants.placeholder),
                image: NetworkImage(product['picture'],),
              ),
              //height: 250.0,
              width: MediaQuery.of(context).size.width / 2.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0, right: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    product['name'],
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\$${product['price']}",
                        style: TextStyle(fontSize: 16.0,),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "\$${product['old_price']}",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "12% Off",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),*/
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(), // to disable GridView's scrolling
        itemCount: productList.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
          );
        });
  }*/

  void _addToCart(context) {
    Navigator.pushNamed(context, UIConstants.ROUTE_CART);
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SingleProd({
    this.prodName,
    this.prodPicture,
    this.prodOldPrice,
    this.prodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCT_DETAILS);
              },
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      prodName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "\$$prodPrice",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      "\$$prodOldPrice",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                  ),
                ),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage(UIConstants.placeholder),
                  image: NetworkImage(prodPicture),
                ),
                /*child: Image.network(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )*/
              ),
            ),
          )
      ),
    );
  }
}
