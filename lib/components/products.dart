import 'package:flutter/material.dart';
import 'package:vividgold_app/models/product.dart';
import 'package:vividgold_app/ui/products/product_details.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class ProductsListItem extends StatelessWidget {
  final Product product1;
  final Product product2;

  ProductsListItem({
    @required this.product1,
    @required this.product2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildProductItemCard(context, product1),
        product2 == null
            ? Container()
            : _buildProductItemCard(context, product2),
      ],
    );
  }

  _buildProductItemCard(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsPage(product: product);
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
                product.images[0].imageURL,
              ),*/
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(UIConstants.placeholder),
                image: NetworkImage(product.images[0].imageURL),
              ),
              height: 250.0,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    product.productName,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\$${product.salePrice}",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "\$${product.regularPrice}",
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
                        "${product.discount}% off",
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
        ),
      ),
    );
  }
}

class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
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
      "name": "PS4 Spidey",
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
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(), // to disable GridView's scrolling
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
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
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
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
                    image: NetworkImage(prod_picture),
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
