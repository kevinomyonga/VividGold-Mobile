import 'package:flutter/material.dart';

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
            prod_pricture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
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
              onTap: () {},
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
                  child: Image.network(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )
              ),
            ),
          )
      ),
    );
  }
}
