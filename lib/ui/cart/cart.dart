import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/models/cart_item.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {

  String currency = 'KES';

  int totalItems = 0;
  double itemsPriceTotal = 0.00;

  bool _isCheckoutButtonEnabled = false;

  List<Item> cartItemList = <Item>[
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
  void initState() {
    super.initState();
    _getTotals();

    setState(() {
      if(cartItemList.length > 0) {
        _isCheckoutButtonEnabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(toolbarName),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Card(
            margin: new EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: _buildCartSummary(),
          ),
        ),
      ),
      body: _buildCartPage(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildCartSummary() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        margin: new EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "ITEMS ($totalItems)",
                style: new TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              new Text(
                "TOTAL : " + currency + " ${UIConstants.formatter.format(itemsPriceTotal)}",
                style: new TextStyle(
                    color: UIColors.cartItemPriceColor,
                    fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
            ]
        ),
      ),
    );
  }

  _buildCartPage(BuildContext context) {

    final firstList = new Flexible(
      child: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cartItemList.length,
        itemBuilder: (context, index) {

          return CartListItem(product: cartItemList[index]);
        },
      ),
    );

    return new Column(
      children: <Widget>[
        firstList,
      ],
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
              onPressed: _isCheckoutButtonEnabled ? _proceedToCheckout : null,
              color: UIColors.proceedToCheckoutButtonColor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.cashRegister,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      UIConstants.proceed_to_payment,
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

  _proceedToCheckout() {
    Navigator.pushNamed(context, UIConstants.ROUTE_CHECKOUT);
  }

  _getTotals() {
    setState(() {

      for (var item in cartItemList) {
        // Total Items
        totalItems = totalItems + int.parse(item.itemQun);

        // Total Items Price
        itemsPriceTotal = itemsPriceTotal + (double.parse(item.itemPrice) *
            int.parse(item.itemQun));
      }
    });
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
