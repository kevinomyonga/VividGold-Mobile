import 'package:flutter/material.dart';
import 'package:vividgold_app/models/cart_item.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
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
  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  List<Item> itemList = <Item>[
    Item(itemName: 'Black Grape', itemQun: 'Qty:1', itemPrice: '\₹ 100'),
    Item(itemName: 'Tomato', itemQun: 'Qty:3', itemPrice: '\₹ 112'),
    Item(itemName: 'Mango', itemQun: 'Qty:2', itemPrice: '\₹ 105'),
    Item(itemName: 'Capsicum', itemQun: 'Qty:1', itemPrice: '\₹ 90'),
    Item(itemName: 'Lemon', itemQun: 'Qty:2', itemPrice: '\₹ 70'),
    Item(itemName: 'Apple', itemQun: 'Qty:1', itemPrice: '\₹ 50'),
  ];

  String toolbarname = UIConstants.payment;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
      title: Text(toolbarname),
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
      body: _buildPaymentPage(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildPaymentPage(context) {
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
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.play_circle_outline,
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
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.check_circle,
                                                color: Colors.blue,
                                              ),
                                              onPressed: null)
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )))),
            new Container(
                alignment: Alignment.bottomLeft,
                height: 50.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total :',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'KES 524000000',
                      style: TextStyle(fontSize: 25.0,
                      ),
                    ),
                  ],
                )
            ),
            _verticalDivider(),
            Container(
                margin: EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    color: Colors.green.shade100,
                    child: Container(
                        padding:
                        const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        child: Text(
                            "GET EXTRA 5% OFF* with MONEY bank Simply Save Credit card. T&C.",
                            maxLines: 10,
                            style: TextStyle(
                              fontSize: 13.0, color: Colors.black87,
                            )
                        )
                    ),
                  ),
                )),
            new Container(
              alignment: Alignment.topLeft,
              margin:
              EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: new Text(
                'Payment Method',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            _verticalDivider(),
            new Container(
                height: 264.0,
                margin: EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Wallet / UPI",
                                      maxLines: 10,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      )
                                  ),
                                  Radio<int>(
                                      value: 0,
                                      groupValue: 0,
                                      onChanged: handleRadioValueChanged),
                                ],
                              ),
                            ),
                            Divider(),
                            _verticalD(),
                            Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Net Banking",
                                        maxLines: 10,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        )
                                    ),
                                    Radio<int>(
                                        value: 0,
                                        groupValue: radioValue,
                                        onChanged: handleRadioValueChanged),
                                  ],
                                )),
                            Divider(),
                            _verticalD(),
                            Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Credit / Debit / ATM Card",
                                        maxLines: 10,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        )
                                    ),
                                    Radio<int>(
                                        value: 0,
                                        groupValue: 0,
                                        onChanged: handleRadioValueChanged),
                                  ],
                                )),
                            Divider(),
                            _verticalD(),
                            Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Cash on Delivery",
                                        maxLines: 10,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        )
                                    ),
                                    Radio<int>(
                                        value: 0,
                                        groupValue: 0,
                                        onChanged: handleRadioValueChanged),
                                  ],
                                )
                            ),
                          ],
                        )),
                  ),
                )),
          ],
        ),
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
              onPressed: () {},
              color: UIColors.proceedToPayButtonColor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "PROCEED TO PAY",
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
    margin: EdgeInsets.only(left: 5.0),
  );
}
