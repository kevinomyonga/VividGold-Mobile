import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class OrderDetailsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => OrderDetailsPageState();
}

class OrderDetailsPageState extends State<OrderDetailsPage> {

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
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text('Details About The Order'),
              ],
            )
        )
    );
  }
}
