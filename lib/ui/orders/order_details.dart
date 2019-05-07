import 'package:flutter/material.dart';
import 'package:vividgold_app/models/cart_item.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/widgets/checkout_list_item.dart';

class OrderDetailsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => OrderDetailsPageState();
}

class OrderDetailsPageState extends State<OrderDetailsPage> {

  int totalItems = 0;
  double itemsPriceTotal = 0.00;
  double orderTotal = 0.00;

  String currency = 'KES';

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
      appBar: AppBar(
        title: Text(UIConstants.order_details),
      ),
      body: _buildOrderDetailsPage(context),
    );
  }

  _buildOrderDetailsPage(BuildContext context) {

    return new Container(
        child: SingleChildScrollView(
          child: new Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //textDirection: TextDirection.ltr,
            children: <Widget>[
              _buildOrderInfo(context),
              _buildProductsList(context),
              _buildShippingAddress(context),
              _buildPaymentInfo(context),
              _buildOrderSummary(context),
            ],
          ),
        )
    );
  }

  _buildOrderInfo(context) {

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
        children: <Widget>[
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
                            new Text('Order Date:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text('May 3, 2019'),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Order #:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text('007'),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Order Total:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(currency +
                                  ' ${UIConstants.formatter.format(orderTotal)}',),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Order Status:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(
                                'Completed',
                                style: TextStyle(
                                  color: UIColors.orderCompletedColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ]
                      ),
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
            margin: EdgeInsets.only(top: 7.0),
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
            margin: EdgeInsets.all(16.0),
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

  _buildShippingAddress(context) {

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 7.0),
            child: new Row(
              children: <Widget>[
                _verticalD(),
                new Text(
                  UIConstants.shipping_address,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20.0,
                        color: UIColors.primaryColor,
                      ),
                      Text(
                          '319 Alexander Drive,Ponder,Texas',
                          style: TextStyle(
                            fontSize: 13.0,
                          )
                      ),
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

  _buildPaymentInfo(context) {

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 7.0),
            child: new Row(
              children: <Widget>[
                _verticalD(),
                new Text(
                  'Payment Information',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20.0,
                        color: UIColors.primaryColor,
                      ),
                      Text(
                          '1338 Karen Lane,Louisville,Kentucky',
                          style: TextStyle(
                            fontSize: 13.0,
                          )
                      ),
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

  _buildOrderSummary(context) {

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 7.0),
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
                              child: new Text(
                                  currency + ' ${UIConstants.formatter.format(itemsPriceTotal)}'
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            new Text('Shipping & Handling:'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: new Text(
                                  currency + ' ${UIConstants.formatter.format(0.00)}'
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
                                  currency + ' ${UIConstants.formatter.format(0.00)}'
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
                              child: new Text(
                                currency +
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

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
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
