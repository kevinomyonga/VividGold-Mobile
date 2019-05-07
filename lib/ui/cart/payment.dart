import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/models/payment_method.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class PaymentPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {

  List<PaymentMethod> paymentMethods = PaymentMethod.getPaymentMethods();

  String currency = 'KES';

  int totalItems = 0;
  double itemsPriceTotal = 0.00;
  double orderTotal = 540000000.00;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedRadio;

  String barcode = "";

  bool _isPaymentButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    //selectedRadio = 0;
    //paymentMethods = PaymentMethod.getPaymentMethods();
  }

  handleRadioValueChanged(int value) {
    setState(() {
      selectedRadio = value;
      _isPaymentButtonEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(UIConstants.payment),
      ),
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
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    )
                )
            ),
            new Container(
              //alignment: Alignment.bottomLeft,
              //height: 50.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      currency + ' ${orderTotal.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 32.0,
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
                )
            ),
            _buildPaymentMethod(),
            _buildGiftAndPromotionCodes(),
          ],
        ),
      ),
    );
  }

  _buildPaymentMethod() {
    return Container(
        child: Column(
          //padding: EdgeInsets.only(bottom: 7.0),
            children: <Widget>[
              new Container(
                alignment: Alignment.topLeft,
                margin:
                EdgeInsets.only(left: 12.0, top: 5.0),
                child: new Text(
                  'Payment Method',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              _verticalDivider(),
              new Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                    child: Container(
                      child: new ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: paymentMethods.length,
                        itemBuilder: (context, index) {

                          return new Container(
                            margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 2.0),
                            child: Container(
                              //padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: new Column(
                                children: <Widget>[
                                  index > 0 ? Divider(height: 15.0) : new Container(),
                                  _buildPaymentMethodListItemCard(paymentMethods[index], index),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
              ),
            ]
        )
    );
  }

  _buildPaymentMethodListItemCard(PaymentMethod paymentMethod, int paymentMethodValue) {

    return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(paymentMethod.pMethodName,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 15.0,
                )
            ),
            Radio<int>(
              value: paymentMethodValue,
              groupValue: selectedRadio,
              onChanged: (val) {
                handleRadioValueChanged(val);
              },
            ),
          ],
        )
    );
  }

  _buildGiftAndPromotionCodes() {

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
                  'Gift Cards & Promotional Codes',
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
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            new TextField(
                              controller: TextEditingController(text: barcode),
                              decoration: InputDecoration(
                                filled: true,
                                //fillColor: UIColors.searchFieldColor,
                                suffixIcon: IconButton(
                                  icon:Icon(
                                    FontAwesomeIcons.camera,
                                    size: 22.0,
                                    color: UIColors.searchPrefixIconColor,
                                  ),
                                  onPressed: () {
                                    scan();
                                  },
                                ),
                                hintText: 'Enter Code Or Scan Gift Card',
                                hintStyle: TextStyle(
                                  color: UIColors.searchFieldHintTextColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                //contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0)
                                ),
                              ),
                              //onChanged: searchOperation,
                            ),
                          ],
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
              onPressed: _isPaymentButtonEnabled ? _proceedToPay : null,
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

  _proceedToPay() {
    switch (selectedRadio) {
      case 0:
      //return new HomePage();
      case 1:
      //return new CategoriesPage();
      case 2:
      //return new NotificationsPage();
      case 3:
      //return new AccountPage();
      case 4:
      //return new OrdersPage();
      case 5:
      //return new FavouritesPage();

      default:
        return new Text("Error");
    }
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 5.0),
  );
}
