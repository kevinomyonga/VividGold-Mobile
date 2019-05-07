import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vividgold_app/models/cart_item.dart';
import 'package:vividgold_app/models/product.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class CartListItem extends StatelessWidget {

  final Item product;

  final String currency = 'KES';

  CartListItem({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCartItemCard(context, product);
  }

  _buildCartItemCard(BuildContext context, Item product) {

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
              left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
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
                      new Text(
                        currency + ' ${UIConstants.formatter.format(double.parse(product.itemPrice))}',
                        style: TextStyle(
                          color: UIColors.cartItemPriceColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new CupertinoButton(
                padding: EdgeInsets.zero,
                child: new Icon(
                  CupertinoIcons.minus_circled,
                  color: UIColors.brandColor,
                  semanticLabel: 'Substract',
                ),
                onPressed: () {
                },
              ),
              new Text(
                product.itemQun.toString(),
                style: const TextStyle(
                  //color: const Color(0xFF8E8E93),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              new CupertinoButton(
                padding: EdgeInsets.zero,
                child: new Icon(
                  CupertinoIcons.plus_circled,
                  color: UIColors.brandColor,
                  semanticLabel: 'Add',
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );

    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      child: new Container(
        margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
        child: Card(
          //elevation: 1.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  row,
                ],
              ),
            )
        ),
      ),
      actions: <Widget>[
        new IconSlideAction(
          caption: UIConstants.favourite,
          color: Colors.blue,
          icon: Icons.favorite_border,
          //onTap: () => _showSnackBar('Archive'),
        ),
      ],
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: UIConstants.remove,
          color: Colors.red,
          icon: Icons.remove_shopping_cart,
          //onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
