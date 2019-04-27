import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class CartPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class Item {
  final String itemImage;
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemImage, this.itemName, this.itemQun, this.itemPrice});
}

class CartPageState extends State<CartPage> {

  String currency = 'Kshs';

  List<Item> itemList = <Item>[
    Item(
        itemImage: 'https://vividgold.co.ke/wp-content/uploads/2018/09/PS4-Console-Pro-1TB-Black-SpiderMan.jpg',
        itemName: 'PS4 Pro Console Spiderman Bundle',
        itemQun: '1',
        itemPrice: '42000.00'),
    Item(
        itemImage: 'https://vividgold.co.ke/wp-content/uploads/2019/03/LIVE-18-203x250.jpg',
        itemName: 'NBA Live 18',
        itemQun: '3',
        itemPrice: '6000.00'),
    Item(
        itemImage: 'https://vividgold.co.ke/wp-content/uploads/2019/01/500pro-headset.jpg',
        itemName: 'Pro Gaming Headset',
        itemQun: '2',
        itemPrice: '15000.00'),
    Item(
        itemImage: 'https://vividgold.co.ke/wp-content/uploads/2017/10/ps4-red1.png',
        itemName: 'PS4 Dualshock 4 - Red',
        itemQun: '1',
        itemPrice: '5500.00'),
    Item(
        itemImage: 'https://vividgold.co.ke/wp-content/uploads/2017/10/neon-switch.png',
        itemName: 'Nintendo Switch Neon',
        itemQun: '2',
        itemPrice: '35000.00'),
    Item(
        itemImage: 'https://vividgold.co.ke/wp-content/uploads/2019/02/viking.jpg',
        itemName: 'Viking',
        itemQun: '1',
        itemPrice: '4000.00'),
  ];

  String toolbarName = UIConstants.cart;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(toolbarName),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Card(
            margin: new EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: _buildCartSummary(context),
          ),
        ),
      ),
      body: _buildCartPage(context),
    );
  }

  _buildCartSummary(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        margin: new EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "ITEMS (6)",
                style: new TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              new Text(
                "TOTAL : " + currency + "262000.00",
                style: new TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
            ]
        ),
      ),
    );
  }

  _buildCartPage(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    final firstList = new Flexible(
      child: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,
        itemBuilder: (context, index) {

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
                                        itemList[index].itemImage,
                                        width: 300.0,
                                        height: 300.0,
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                      ),
                                      tag: itemList[index].itemName,
                                    ),
                                  ),
                                ),
                              );
                            }));
                      },
                      child: new Hero(
                        tag: itemList[index].itemName,
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
                            image: NetworkImage(itemList[index].itemImage,),
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
                              itemList[index].itemName,
                              style: new TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w700),
                            ),
                            const Padding(
                                padding: const EdgeInsets.only(top: 5.0)),
                            new Text(
                              currency + itemList[index].itemPrice,
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
                        color: UIColors.primaryColor,
                        semanticLabel: 'Substract',
                      ),
                      onPressed: () {
                      },
                    ),
                    new Text(
                      itemList[index].itemQun.toString(),
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
                        color: UIColors.primaryColor,
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
                          Icons.remove_shopping_cart,
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

              new Container(
                height: 30.0,
                width: 1.0,
                color: UIColors.primaryColor,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              ),

              Flexible(
                flex: 1,
                child: FlatButton(
                  onPressed: () {},
                  //color: Colors.green,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          size: 18.0,
                          color: UIColors.primaryColor,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Flexible(
                          child: new Text(
                            "ADD TO FAVORITES",
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

          return new Container(
            margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
            child: Card(
                elevation: 4.0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                      10.0, 10.0, 10.0, 10.0),
                  child: new Column(
                    children: <Widget>[
                      row,
                      Divider(
                        height: 10.0,
                        color: UIColors.primaryColor,
                      ),
                      buttons
                    ],
                  ),
                )
            ),
          );
        },
      ),
    );

    return new Column(
      children: <Widget>[
        firstList,
        new Container(
          height: 50.0,
          //color: Colors.white,
          child: new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, UIConstants.ROUTE_CHECKOUT);
                /*Navigator.of(context).push(new CupertinoPageRoute(
                  *//*builder: (BuildContext context) => new OrderSummary(
                              cartTotal:
                              fbconn.getTotalProductPrice().toString(),
                              totalItems: fbconn.getDataSize().toString(),
                            )*//*
                ));*/
              },
              child: new Container(
                width: screenSize.width,
                margin: new EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 2.0),
                height: 50.0,
                decoration: new BoxDecoration(
                    color: UIColors.primaryColor,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(5.0))),
                child: new Center(
                    child: new Text(
                      UIConstants.proceed_to_payment,
                      style: new TextStyle(
                        //color: Colors.white,
                      ),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  verticalDivider() =>
      Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() =>
      Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 07.0, bottom: 0.0),
      );

  void showDemoDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    )
        .then<void>((T value) { // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('You selected: $value')
        ));
      }
    });
  }
}
