import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class OrderDetailsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => OrderDetailsPageState();
}

class Item {
  final String itemImage;
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemImage, this.itemName, this.itemQun, this.itemPrice});
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
                  //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(7.0),
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
                                            '${orderTotal.toStringAsFixed(2)}',),
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
                                          currency + itemList[index].itemPrice,
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
                                          itemList[index].itemQun.toString(),
                                        ),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      new Text(
                                        'Total:',
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: new Text(currency +
                                          (double.parse(itemList[index].itemPrice) *
                                              int.parse(itemList[index].itemQun)).toStringAsFixed(2),
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

        return new Container(
          margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
          child: Container(
            //padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
