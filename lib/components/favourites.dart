import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Favourites extends StatefulWidget {

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  var favouritesList = [
    {
      "name": "NBA Live",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2019/03/LIVE-18-203x250.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Viking",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2019/02/viking.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "PS4 Pro Console Spiderman Bundle",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2018/09/PS4-Console-Pro-1TB-Black-SpiderMan.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Headphones",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2019/01/500pro-headset.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "N Switch",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2017/10/neon-switch.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "PS4 Pad",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2017/10/ps4-red1.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "XBOX Pad",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2017/10/xbox-1-white-slim.jpg",
      "old_price": 100,
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: ScrollPhysics(), // to disable GridView's scrolling
      crossAxisCount: 4,
      itemCount: favouritesList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildFavouriteItemCard(context, favouritesList[index]);
      },
      staggeredTileBuilder: (int index) =>
      //new StaggeredTile.count(2, index.isEven ? 2 : 1),
      new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );

    /*return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(), // to disable GridView's scrolling
        itemCount: productList.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItemCard(context, productList[index]);
        });*/
  }

  _buildFavouriteItemCard(BuildContext context, var product) {

    final buttons = new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: FlatButton(
            onPressed: () {},
            //color: Colors.grey,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.delete_forever,
                    size: 18.0,
                    color: UIColors.primaryColor,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Flexible(
                    child: new Text(
                      "REMOVE",
                      style: new TextStyle(
                          color: UIColors.primaryColor,
                          fontSize: 10.0
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCT_DETAILS);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              /*child: Image.network(
                product['picture'],
                fit: BoxFit.fitWidth,
              ),*/
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
                  buttons,
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
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
