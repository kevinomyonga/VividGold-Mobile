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
      ),
      body: _buildCartPage(context),
    );
  }

  _buildCartPage(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    final cartSummary = new Padding(
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
            ]),
      ),
    );

    final firstList = new Flexible(
      child: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,
        itemBuilder: (context, index) {

          final row = new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
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
                        color: const Color(0xFF8E8E93),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new GestureDetector(
                  onTap: () {
                    //fbconn.removeFromCart(index);
                    /* showInSnackBar(fbconn.getProductNameAsList()[index] +
                              " has been removed");
                          setState(() {});*/
                  },
                  child: new Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(5.0))),
                    child: new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: new Icon(
                                Icons.remove_shopping_cart,
                                size: 18.0,
                                color: UIColors.primaryColor,
                              ),
                            ),
                            new Text(
                              "REMOVE",
                              style: new TextStyle(
                                  color: UIColors.primaryColor,
                                  fontSize: 10.0
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              new Container(
                height: 30.0,
                width: 1.0,
                color: UIColors.primaryColor,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new GestureDetector(
                  onTap: () {
                    //fbconn.addIsFavoriteIndex(true, index);
                    /* showInSnackBar(fbconn.getProductNameAsList()[index] +
                              " has been added to your favorites");
                          setState(() {});*/
                  },
                  child: new Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(5.0))),
                    child: new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: new Icon(
                                Icons.favorite_border,
                                size: 18.0,
                                color: UIColors.primaryColor,
                              ),
                            ),
                            new Text(
                              "ADD TO FAVORITES",
                              style: new TextStyle(
                                  color: UIColors.primaryColor,
                                  fontSize: 10.0
                              ),
                            ),
                          ],
                        )
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
        cartSummary,
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
                      "PROCEED TO CHECKOUT",
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

    /*IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
      return null;
    }

    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      assert(false);
      return null;
    }

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    double dd = width * 0.77;
    double hh = height - 215.0;
    int item = 0;

    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0),
            child: Card(
                child: Container(
                    padding:
                    const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: GestureDetector(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // three line description
                            Row(
                              children: <Widget>[
                                Text(
                                  'Pincode : ',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal,
                                    //color: Colors.black54,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 2.0),
                                ),
                                GestureDetector(
                                  child: Text(
                                    '383310',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      //color: Colors.black
                                    ),
                                  ),
                                  onTap: () {
                                    showDemoDialog<DialogDemoAction>(
                                        context: context,
                                        child: AlertDialog(
                                            title: const Text(
                                                'Location/Area Pincode'),
                                            content:SizedBox(
                                              height: 24.0,
                                              child: TextFormField(
                                                  keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                                                  decoration: new InputDecoration(
                                                      hintText: '******',
                                                      labelText: 'Pincode'
                                                  ),
                                                  //  validator: this._validateEmail,
                                                  onSaved: (String value) {
                                                    //this.pincode = value;
                                                  }
                                              ),),

                                            actions: <Widget>[
                                              FlatButton(
                                                  child: const Text(
                                                      'CANCEL'),
                                                  onPressed: () {
                                                    Navigator.pop(context,
                                                        DialogDemoAction
                                                            .disagree);
                                                  }
                                              ),
                                              FlatButton(
                                                  child: const Text('SAVE'),
                                                  onPressed: () {
                                                    Navigator.pop(context,
                                                        DialogDemoAction
                                                            .agree);
                                                  }
                                              )
                                            ]
                                        )
                                    );
                                  },
                                )

                              ],
                            ),
                          ],
                        ))))),
        Container(
            margin: EdgeInsets.only(
                left: 12.0, top: 5.0, right: 12.0, bottom: 10.0),
            height: hh,
            child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (BuildContext cont, int ind) {
                  return SafeArea(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: <Widget>[
                            Container(

                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: <Widget>[
                                    Container(

                                      height: 120.0,
                                      width: dd,
                                      child: Card(
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                                height: 110.0,
                                                width: 100.0,
                                                child: Image.asset(
                                                  itemList[ind].itemImage,
                                                  fit: BoxFit.fill,
                                                )),
                                            SizedBox(
                                                height: 110.0,
                                                child: Container(
                                                  alignment: Alignment
                                                      .topLeft,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      _verticalD(),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            itemList[ind].itemName,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18.0,
                                                              //color: Colors.black
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      _verticalD(),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            itemList[ind].itemPrice,
                                                            style: TextStyle(
                                                              fontSize: 15.0,
                                                              //color:Colors.black54
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          new IconButton(
                                                            icon: Icon(
                                                                _add_icon(),
                                                                color: Colors
                                                                    .amber
                                                                    .shade500),
                                                            onPressed: () {
                                                              // item = item + 1;
                                                            },

                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .only(
                                                                left: 2.0),
                                                          ),
                                                          Text(
                                                            item.toString(),
                                                            *//*     style: descriptionStyle.copyWith(
                                                   fontSize: 20.0,
                                                   color: Colors.black87),*//*
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .only(
                                                                right: 2.0),
                                                          ),
                                                          new IconButton(
                                                            icon: Icon(
                                                                _sub_icon(),
                                                                color: Colors
                                                                    .amber
                                                                    .shade500),
                                                            onPressed: () {
                                                              *//* if(item<0){
                                                 }
                                                 else{
                                                   item = item -1;
                                                 }*//*
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                        height: 110.0,
                                        width: 50.0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            itemList[ind].itemPrice,
                                          ),
                                        )

                                    ),

                                  ],
                                )),

                          ],
                        ),
                      ));
                })),
        Container(
            alignment: Alignment.bottomLeft,
            height: 60.0,
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.info), onPressed: null),
                  Text(
                    'Total :',
                    style: TextStyle(
                        fontSize: 17.0,
                        //color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\₹ 524',
                    style: TextStyle(
                      fontSize: 17.0,
                      //color: Colors.black54
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide:
                          BorderSide(color: Colors.amber.shade500),
                          child: const Text('CONFIRM ORDER'),
                          textColor: Colors.amber.shade500,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutPage()));
                          },
                          shape: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );*/
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
