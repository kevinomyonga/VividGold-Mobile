import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vividgold_app/models/product.dart';
import 'package:vividgold_app/ui/products/product_details.dart';
import 'package:vividgold_app/utils/themes.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsPage();
            },
          ),
        );
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
                          'ADD TO CART',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            //fontFamily: "WorkSansBold"
                          ),
                        ),
                        onPressed: null
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
