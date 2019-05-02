import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class OrdersPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => OrdersPageState();
}

class Item {
  final String name;
  final String deliveryTime;
  final String orderId;
  final String orderAmount;
  final String paymentType;
  final String address;
  final String cancelOrder;

  Item(
      {
        this.name,
        this.deliveryTime,
        this.orderId,
        this.orderAmount,
        this.paymentType,
        this.address,
        this.cancelOrder}
      );
}

class OrdersPageState extends State<OrdersPage> {

  List list = ['12', '11'];
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  VoidCallback _showBottomSheetCallback;
  List<Item> itemList = <Item>[
    Item(
        name: 'Jhone Miller',
        deliveryTime: '26-5-2106',
        orderId: '#CN23656',
        orderAmount: '\₹ 650',
        paymentType: 'online',
        address: '1338 Karen Lane,Louisville,Kentucky',
        cancelOrder: 'Cancel Order'),
    Item(
        name: 'Gautam Dass',
        deliveryTime: '10-8-2106',
        orderId: '#CN33568',
        orderAmount: '\₹ 900',
        paymentType: 'COD',
        address: '319 Alexander Drive,Ponder,Texas',
        cancelOrder: 'View Receipt'),
    Item(
        name: 'Jhone Hill',
        deliveryTime: '23-3-2107',
        orderId: '#CN75695',
        orderAmount: '\₹ 250',
        paymentType: 'online',
        address: '92 Jarvis Street,Buffalo,New York',
        cancelOrder: 'View Receipt'),
    Item(
        name: 'Miller Root',
        deliveryTime: '10-5-2107',
        orderId: '#CN45238',
        orderAmount: '\₹ 500',
        paymentType: 'Bhim/upi',
        address: '103 Romrog Way,Grand Island,Nebraska',
        cancelOrder: 'Cancel Order'),
    Item(
        name: 'Lag Gilli',
        deliveryTime: '26-10-2107',
        orderId: '#CN69532',
        orderAmount: '\₹ 1120',
        paymentType: 'online',
        address: '8 Clarksburg Park,Marble Canyon,Arizona',
        cancelOrder: 'View Receipt'),
  ];

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: _buildOrdersPage(context)
    );
  }

  _buildOrdersPage(context) {

    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext cont, int ind) {
          return SafeArea(
              child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                        //color:Colors.black12,
                        child: Card(
                            elevation: 4.0,
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: GestureDetector(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        // three line description
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            itemList[ind].name,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontStyle: FontStyle.normal,
                                              //color: Colors.black87,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 3.0),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'To Deliver On :' +
                                                itemList[ind].deliveryTime,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              //color: Colors.black54
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 10.0,
                                          color: UIColors.primaryColor,
                                        ),

                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                padding: EdgeInsets.all(3.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Order Id',
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        //color: Colors.black54
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 3.0),
                                                      child: Text(
                                                        itemList[ind].orderId,
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          //color: Colors.black87
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Container(
                                                padding: EdgeInsets.all(3.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Order Amount',
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        //color: Colors.black54
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 3.0),
                                                      child: Text(
                                                        itemList[ind].orderAmount,
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          //color: Colors.black87
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Container(
                                                padding: EdgeInsets.all(3.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Payment Type',
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        //color: Colors.black54
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 3.0),
                                                      child: Text(
                                                        itemList[ind].paymentType,
                                                        style: TextStyle(
                                                          fontSize: 15.0,
                                                          //color: Colors.black87
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                        Divider(
                                          height: 10.0,
                                          color: UIColors.primaryColor,
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              size: 20.0,
                                              color: UIColors.primaryColor,
                                            ),
                                            Text(itemList[ind].address,
                                                style: TextStyle(
                                                  fontSize: 13.0,
                                                )
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 10.0,
                                          color: UIColors.primaryColor,
                                        ),
                                        Container(
                                            child:_status(itemList[ind].cancelOrder)
                                        )
                                      ],
                                    )
                                )
                            )
                        )
                    ),
                  ]
              )
          );
        }
    );
  }

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  Widget _status(status) {
    if(status == 'Cancel Order'){
      return FlatButton.icon(
          label: Text(status,style: TextStyle(color: Colors.red),),
          icon: const Icon(Icons.highlight_off, size: 18.0,color: Colors.red,),
          onPressed: () {
            // Perform some action
          }
      );
    }
    else{
      return FlatButton.icon(
          label: Text(status,style: TextStyle(color: Colors.green),),
          icon: const Icon(Icons.check_circle, size: 18.0,color: Colors.green,),
          onPressed: () {
            // Perform some action
            Navigator.pushNamed(context, UIConstants.ROUTE_ORDER_DETAILS);
          }
      );
    }
    if (status == "3") {
      return Text('Process');
    } else if (status == "1") {
      return Text('Order');
    } else {
      return Text("Waiting");
    }
  }

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
  );

  bool a = true;
  String mText = "Press to hide";
  double _lowerValue = 1.0;
  double _upperValue = 100.0;

  void _visibilitymethod() {
    setState(() {
      if (a) {
        a = false;
        mText = "Press to show";
      } else {
        a = true;
        mText = "Press to hide";
      }
    });
  }
}
