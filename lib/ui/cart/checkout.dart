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
              _buildOrderSummary(context),
              _verticalDivider(),
              _buildDeliveryAddress(context),
              _buildProductsList(context),
            ],
          ),
        )
    );
  }

  _buildDeliveryAddress(context) {

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
                  UIConstants.shipping_address,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
                child: Container(
                  //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, UIConstants.ROUTE_ADDRESSES);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                //color: Colors.black54
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Name
                                      Text(
                                        'Kevin Omyonga',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      // Address
                                      Text(
                                        '319 Alexander Drive,Ponder,Texas',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            letterSpacing: 0.5
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                //color: Colors.black54
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.rate_review,
                                //color: Colors.black54
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                              ),
                              Text(
                                'Add delivery instructions (Optional)',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
          new SizedBox(
            height: 15.0,
          ),
        ],
      ),
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
                              child: new Text(currency + ' ${UIConstants.formatter.format(itemsPriceTotal)}'),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Shipping & Handling:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(
                                  currency + ' ${UIConstants.formatter.format(0.00)}',
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Discount:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(
                                currency + ' ${UIConstants.formatter.format(0.00)}',
                              ),
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
                                  ' ${UIConstants.formatter.format(orderTotal)}',
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
