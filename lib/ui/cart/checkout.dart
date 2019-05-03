import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/cart/payment.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckoutPageState();
}

class Item {
  final String itemImage;
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemImage, this.itemName, this.itemQun, this.itemPrice});
}

class CheckoutPageState extends State<CheckoutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

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

  String toolbarName = UIConstants.checkout;

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;

    AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(_backIcon()),
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(toolbarName),
      actions: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Container(
            height: 150.0,
            width: 30.0,
            child: new GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder:(BuildContext context) =>
                      new CartItemsScreen()
                  )
              );*/
              },
            ),
          ),
        )
      ],
    );

    return new Scaffold(
        key: _scaffoldKey,
        appBar: appBar,
        body: _buildCheckoutPage(context)
    );
  }

  _buildCheckoutPage(BuildContext context) {

    return new Container(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: Card(
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // three line description
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Delivery',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                //color: Colors.black
                                              ),
                                            ),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.play_circle_outline,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: null)
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Payment',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                //color: Colors.black38
                                              ),
                                            ),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.check_circle,
                                                  //color: Colors.black38,
                                                ),
                                                onPressed: null)
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          )))),
              _verticalDivider(),
              new Container(
                alignment: Alignment.topLeft,
                margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                child: new Text(
                  'Delivery Address',
                  style: TextStyle(
                    //color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              new Container(
                  height: 165.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 165.0,
                        width: 165.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, UIConstants.ROUTE_ADDRESSES);
                          },
                          child: Card(
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        icon: Icon(Icons.add), onPressed: null)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 165.0,
                        width: 200.0,
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 12.0,
                                        top: 5.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Naomi A. Schultz',
                                          style: TextStyle(
                                            //color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          '2585 Columbia Boulevard',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          'Salisbury',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          'MD 21801',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(
                                              left: 00.0,
                                              top: 05.0,
                                              right: 0.0,
                                              bottom: 5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                'Delivery Address',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  //color: Colors.black26,
                                                ),
                                              ),
                                              _verticalD(),
                                              new Checkbox(
                                                value: checkboxValueA,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    checkboxValueA = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130.0,
                        width: 200.0,
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 12.0,
                                        top: 5.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Lisa J. Cunningham',
                                          style: TextStyle(
                                            //color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          '49 Bagwell Avenue',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          'Ocala',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          ' FL 34471',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(
                                              left: 00.0,
                                              top: 05.0,
                                              right: 0.0,
                                              bottom: 5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                'Delivery Address',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  //color: Colors.black12,
                                                ),
                                              ),
                                              _verticalD(),
                                              new Checkbox(
                                                value: checkboxValueB,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    checkboxValueB = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130.0,
                        width: 200.0,
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 12.0,
                                        top: 5.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Elizabeth J. Schmidt',
                                          style: TextStyle(
                                            //color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          '3674 Oakway Lane',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          'Long Beach',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          ' CA 90802',
                                          style: TextStyle(
                                            //color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        new Container(
                                          margin: EdgeInsets.only(
                                              left: 00.0,
                                              top: 05.0,
                                              right: 0.0,
                                              bottom: 5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                'Delivery Address',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  //color: Colors.black12,
                                                ),
                                              ),
                                              _verticalD(),
                                              new Checkbox(
                                                value: checkboxValueC,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    checkboxValueC = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              _verticalDivider(),
              new Container(
                alignment: Alignment.topLeft,
                margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                child: new Text(
                  'Order Summary',
                  style: TextStyle(
                    //color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              _buildProductsList(context),
              /*Container(
                  margin: EdgeInsets.only(
                      left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
                  height: 170.0,
                  child: ListView.builder(
                      itemCount: itemList.length,
                      itemBuilder: (BuildContext cont, int ind) {
                        return SafeArea(
                            child: Column(
                              children: <Widget>[
                                Divider(height: 15.0),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(

                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      Text(itemList[ind].itemName,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              //color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                      Text(itemList[ind].itemQun,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              //color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                      Text(itemList[ind].itemPrice,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              //color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                    ],

                                  ),
                                ),
                              ],
                            ));
                      })),*/
              Container(
                  alignment: Alignment.bottomLeft,
                  height: 50.0,
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
                                          builder: (context) => PaymentPage()));
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
          ),
        )
    );
  }

  _buildProductsList(context) {

    final firstList = new ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
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
                  new Text(
                    itemList[index].itemQun.toString(),
                    style: const TextStyle(
                      //color: const Color(0xFF8E8E93),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        return new Container(
          margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: new Column(
              children: <Widget>[
                Divider(height: 15.0),
                row,
              ],
            ),
          ),
        );
      },
    );

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
        children: <Widget>[
          new Card(
            elevation: 4.0,
            margin: EdgeInsets.all(16.0),
            child: Container(
              child: firstList,
            ),
          ),
          new SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );firstList;
  }

  IconData _add_icon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.add;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }
  IconData _sub_icon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.remove;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
  );
}
