import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vividgold_app/models/cart_item.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class CheckoutListItem extends StatelessWidget {

  final Item product;

  final String currency = 'KES';

  CheckoutListItem({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCheckoutListItemCard(context, product);
  }

  _buildCheckoutListItemCard(BuildContext context, Item product) {

    final row = new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCT_DETAILS);
      },
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
          child: new Row(
            children: <Widget>[
              new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new Material(
                          color: Colors.black38,
                          child: new Container(
                            padding: const EdgeInsets.all(30.0),
                            child: new GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: new Hero(
                                child: new Image.network(
                                  product.itemImage,
                                  width: 300.0,
                                  height: 300.0,
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                ),
                                tag: product.itemName,
                              ),
                            ),
                          ),
                        );
                      }));
                },
                child: new Hero(
                  tag: product.itemName,
                  child: new Container(
                    height: 60.0,
                    width: 60.0,
                    /*decoration: new BoxDecoration(
                            //color: color,
                            image: new DecorationImage(
                                image: new NetworkImage(
                                  "",
                                  //fbconn.getDefaultIMGAsList()[index]
                                )
                            ),
                            borderRadius: new BorderRadius.circular(8.0),
                          ),*/
                    child: FadeInImage(
                      fit: BoxFit.fill,
                      placeholder: AssetImage(UIConstants.placeholder),
                      image: NetworkImage(product.itemImage,),
                    ),
                  ),
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        product.itemName,
                        style: new TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w700),
                      ),
                      const Padding(
                          padding: const EdgeInsets.only(top: 5.0)),
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        child: Table(
                          /*border: TableBorder.all(width: 1.0, color: Colors.black),*/
                          children: [
                            TableRow(
                                children: [
                                  new Text('Price'),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: new Text(
                                      currency + product.itemPrice,
                                    ),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  new Text('Quantity:'),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: new Text(
                                      product.itemQun.toString(),
                                    ),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  new Text(
                                    'Sub Total:',
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: new Text(currency +
                                        (double.parse(product.itemPrice) *
                                            int.parse(product.itemQun)).toStringAsFixed(2),
                                      style: TextStyle(
                                        color: UIColors.cartItemPriceColor,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return row;
  }
}
