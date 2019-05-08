import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vividgold_app/models/product.dart';
import 'package:vividgold_app/ui/products/product_details.dart';
import 'package:vividgold_app/utils/themes.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  String currency = 'KES';

  var productList = [
    {
      "name": "NBA Live",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2019/03/LIVE-18-203x250.jpg",
      "old_price": 12000.00,
      "price": 8500.00,
    },
    {
      "name": "Viking",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2019/02/viking.jpg",
      "old_price": 5000.00,
      "price": 2000.00,
    },
    {
      "name": "PS4 Pro Console Spiderman Bundle",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2018/09/PS4-Console-Pro-1TB-Black-SpiderMan.jpg",
      "old_price": 0.00,
      "price": 42000.00,
    },
    {
      "name": "Headphones",
      "picture": "https://vividgold.co.ke/wp-content/uploads/2019/01/500pro-headset.jpg",
      "old_price": 10000.00,
      "price": 5000.00,
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
      "price": 6500.00,
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
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildProductItemCard(context, productList[index]);
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

  _buildProductItemCard(BuildContext context, var product) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCT_DETAILS);
      },
      child: Card(
        elevation: 4.0,
        child: new Stack(
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
                        height: 8.0,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 2.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                        child: MaterialButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          highlightColor: Colors.transparent,
                          splashColor: Themes.loginGradientEnd,
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: Text(
                            UIConstants.add_to_cart,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              //fontFamily: "WorkSansBold"
                            ),
                          ),
                          onPressed: () => _addToCart(context),
                        ),
                      ),

                      SizedBox(
                        height: 8.0,
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

  Widget ratingStack(double rating) => Positioned(
    top: 0.0,
    left: 0.0,
    child: Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.cyanAccent,
            size: 10.0,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white, fontSize: 10.0),
          )
        ],
      ),
    ),
  );

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
