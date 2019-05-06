import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/models/cart_item.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/widgets/checkout_list_item.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckoutPageState();
}

class CheckoutPageState extends State<CheckoutPage> {

  String currency = 'KES';

  int totalItems = 0;
  double itemsPriceTotal = 0.00;
  double orderTotal = 0.00;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

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

  @override
  void initState() {
    super.initState();
    _getTotals();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(UIConstants.checkout),
      ),
      body: _buildCheckoutPage(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
              _buildOrderSummary(context),
              _buildProductsList(context),
            ],
          ),
        )
    );
  }

  _buildOrderSummary(context) {

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 7.0, top: 7.0,),
            child: new Row(
              children: <Widget>[
                _verticalD(),
                new Text(
                  'Order Summary',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Table(
                    /*border: TableBorder.all(width: 1.0, color: Colors.black),*/
                    children: [
                      TableRow(
                          children: [
                            new Text('Items($totalItems):'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(currency + '${itemsPriceTotal.toStringAsFixed(2)}'),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Shipping & Handling:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(currency + '0.00'),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Discount:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(currency + '0.00'),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Order Total:',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(currency +
                                  '${orderTotal.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: UIColors.cartItemPriceColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ]
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          new SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  _buildProductsList(context) {

    final firstList = new ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: itemList.length,
      itemBuilder: (context, index) {

        return new Container(
          margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
          child: Container(
            //padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: new Column(
              children: <Widget>[
                index > 0 ? Divider(height: 15.0) : new Container(),
                CheckoutListItem(product: itemList[index],),
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
          new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 7.0, top: 7.0,),
            child: new Row(
              children: <Widget>[
                _verticalD(),
                new Text(
                  'Items',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Card(
            //elevation: 4.0,
            margin: EdgeInsets.all(7.0),
            child: Container(
              child: firstList,
            ),
          ),
          //firstList,
          new SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, UIConstants.ROUTE_PAYMENT);
              },
              color: UIColors.confirmOrderButtonColor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.checkDouble,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "CONFIRM ORDER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
  );

  _getTotals() {
    setState(() {

      for (var item in itemList) {
        // Total Items
        totalItems = totalItems + int.parse(item.itemQun);

        // Total Items Price
        itemsPriceTotal = itemsPriceTotal + (double.parse(item.itemPrice) *
            int.parse(item.itemQun));

        // Order Total
        orderTotal = itemsPriceTotal;
      }
    });
  }
}
