import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Favourites extends StatefulWidget {

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {

  String currency = 'KES';

  var favouritesList = [
    {
      "name": "PS4 Pro Console Spiderman Bundle",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2018/09/PS4-Console-Pro-1TB-Black-SpiderMan.jpg",
      "old_price": 100000.00,
      "price": 50000.00,
    },
    {
      "name": "N Switch",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2017/10/neon-switch.png",
      "old_price": 100000.00,
      "price": 50000.00,
    },
    {
      "name": "PS4 Pad",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2017/10/ps4-red1.png",
      "old_price": 0.00,
      "price": 5000.00,
    },
    {
      "name": "XBOX Pad",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2017/10/xbox-1-white-slim.jpg",
      "old_price": 0.00,
      "price": 5500.00,
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
  }

  _buildFavouriteItemCard(BuildContext context, var product) {

    final buttons = new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: new OutlineButton(
              borderSide: BorderSide(color: UIColors.deleteButtonColor),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.delete_forever,
                      size: 18.0,
                      color: UIColors.deleteButtonColor,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Flexible(
                      child: new Text(
                        UIConstants.remove,
                        style: new TextStyle(
                            color: UIColors.deleteButtonColor,
                            fontSize: 14.0
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //textColor: UIColors.primaryColor,
              onPressed: () {
                //Navigator.pushNamed(context, UIConstants.ROUTE_CATEGORIES);
              },
              shape: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
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
        child:  new Stack(
          children: <Widget>[
            Column(
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
                      // Hide Old Price if no discount is being offered.
                      product['old_price'] > 0 ? Text(
                        currency + ' ${UIConstants.formatter.format(product['old_price'])}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ) : new Container(),
                      Text(
                        currency + ' ${UIConstants.formatter.format(product['price'])}',
                        style: TextStyle(fontSize: 14.0,),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      buttons,
                      SizedBox(
                        height: 2.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              // padding: EdgeInsets.all(5.0),
              child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border, color: Colors.grey,
                  ),
                  onPressed: (){}
              ),
            ),
            // Hide discount stack if none is being offered
            product['old_price'] > 0 ? discountStack(12) : new Container(),
          ],
        ),
      ),
    );
  }

  Widget discountStack(double discount) => Positioned(
    top: 0.0,
    right: 0.0,
    child: Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0))),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.cyanAccent,
            size: 10.0,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(
            discount.toString() + '% Off',
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.0
            ),
          )
        ],
      ),
    ),
  );

  void _addToCart(context) {
    Navigator.pushNamed(context, UIConstants.ROUTE_CART);
  }
}
