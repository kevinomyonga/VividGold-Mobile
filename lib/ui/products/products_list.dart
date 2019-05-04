import 'package:flutter/material.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class TabItem {
  String title;
  TabItem(this.title);
}

class ProductsListPage extends StatefulWidget {

  @override
  _ProductsListPageState createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {

  VoidCallback _showBottomSheetCallback;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List list = ['12', '11'];

  final tabItems = [
    new TabItem('All'),
    new TabItem('PS4 Games'),
    new TabItem('PS4 Consoles & VR'),
    new TabItem('PS4 Accessories'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabItems.length,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 1.0,
            title: Text("Product List"),
            actions: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Container(
                  height: 150.0,
                  width: 30.0,
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UIConstants.ROUTE_CART);
                    },
                    child: Stack(
                      children: <Widget>[
                        new IconButton(
                            icon: new Icon(
                              Icons.shopping_cart,
                            ),
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                              Navigator.pushNamed(context, UIConstants.ROUTE_CART);
                            }
                        ),
                        list.length == 0
                            ? new Container()
                            : new Positioned(
                            child: new Stack(
                              children: <Widget>[
                                new Icon(Icons.brightness_1,
                                    size: 20.0, color: Colors.green.shade500),
                                new Positioned(
                                    top: 4.0,
                                    right: 5.5,
                                    child: new Center(
                                      child: new Text(
                                        list.length.toString(),
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Card(
                margin: new EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: TabBar(
                  labelColor: UIColors.tabsSelectedLabelColor,
                  //labelColor: UIColors.tabsLabelThemeColor(context),
                  unselectedLabelColor: UIColors.tabsUnselectedLabelColor,
                  //unselectedLabelColor: Colors.black26,
                  isScrollable: true,
                  tabs: List<Widget>.generate(tabItems.length, (int index){
                    return new Tab(text: tabItems[index].title);
                  }),
                ),
              ),
            ),
          ),
          body: TabBarView(
              children: List<Widget>.generate(tabItems.length, (int index){
                return Products();
              })
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.filter_list), onPressed: () {
            _showBottomSheet();
          },
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        ),
      ),
    );
  }

  _buildBottomNavigationBar(context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          IconButton(icon: Icon(Icons.search), onPressed: () {
            _goToSearch(context);
          },),
        ],
      ),
    );
  }

  _goToSearch(context) {
    Navigator.pushNamed(context, UIConstants.ROUTE_SEARCH);
  }

  void _showBottomSheet() {
    setState(() { // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      final ThemeData themeData = Theme.of(context);
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          alignment: Alignment.topLeft,
          //padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: themeData.disabledColor))
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    IconButton(icon: const Icon(Icons.close), onPressed: (){
                      Navigator.pop(context);
                    }),
                    Text(
                      'FILTER/SORTING',
                      style: TextStyle(
                        fontSize: 12.0,
                        //color: Colors.black26
                      ),
                    ),
                    _verticalD(),
                    OutlineButton(
                        borderSide: BorderSide(color: UIColors.primaryColor),
                        child: const Text('CLEAR'),
                        textColor: UIColors.primaryColor,
                        onPressed: () {},
                        shape: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    _verticalD(),
                    OutlineButton(
                        borderSide: BorderSide(color: UIColors.primaryColor),
                        child: const Text('APPLY'),
                        textColor: UIColors.primaryColor,
                        onPressed: () {},
                        shape: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                  ],
                ),
                Divider(),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sort',
                          style: TextStyle(
                            //color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                ),
                Container(
                    height: 115.0,
                    margin: EdgeInsets.only(top: 5.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          child: Card(
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          new Text(
                                            'LOWEST',
                                            style: TextStyle(
                                              //color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'PRICE',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'FIRST',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
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
                          child: Card(
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          new Text(
                                            'HIGHEST',
                                            style: TextStyle(
                                              //color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'PRICE',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'FIRST',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
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
                          child: Card(
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            'POPULAR',
                                            style: TextStyle(
                                              //color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'PRICE',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'FIRST',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
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
                          child: Card(
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            'NEWEST',
                                            style: TextStyle(
                                              //color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'PRICE',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'FIRST',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
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
                          child: Card(
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            'BEST',
                                            style: TextStyle(
                                              //color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'PRICE',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'FIRST',
                                            style: TextStyle(
                                              //color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
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
                    )
                ),
                _verticalDivider(),
                Divider(),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: TextStyle(
                            //color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        _verticalDivider(),
                        Text(
                          'PRICE',
                          style: TextStyle(
                            //color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                ),

                /*  Container(
          padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child: new Column(
              children: <Widget>[]
                ..add(
                  //
                  // Simple example
                  //
                  new RangeSlider(
                    min: 0.0,
                    max: 100.0,
                    lowerValue: _lowerValue,
                    upperValue: _upperValue,
                    divisions: 5,
                    showValueIndicator: true,
                    valueIndicatorMaxDecimals: 1,
                    onChanged: (double newLowerValue, double newUpperValue) {
                      setState(() {
                        _lowerValue = newLowerValue;
                        _upperValue = newUpperValue;
                      });
                    },
                    onChangeStart:
                        (double startLowerValue, double startUpperValue) {
                      print(
                          'Started with values: $startLowerValue and $startUpperValue');
                    },
                    onChangeEnd: (double newLowerValue, double newUpperValue) {
                      print(
                          'Ended with values: $newLowerValue and $newUpperValue');
                    },
                  ),
                )
              // Add some space
                ..add(
                  new SizedBox(height: 24.0),
                )
              //
              // Add a series of RangeSliders, built as regular Widgets
              // each one having some specific customizations
              //
                ..addAll(_buildRangeSliders())),
        ),*/

                _verticalDivider(),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        _verticalDivider(),
                        Text(
                          'SELECT OFFER',
                          style: TextStyle(
                            //color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),

                      ],
                    )
                ),
                Container(
                    height: 80.0,
                    margin: EdgeInsets.only(top: 5.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height:80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.pink.shade100,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      color: Colors.pink.shade100,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          new Text(
                                            'Buy More,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'Save More',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),




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
                          height:80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.indigo.shade500,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(

                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          new Text(
                                            'Special,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'Price',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),




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
                          height:80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.teal.shade200,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(

                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          new Text(
                                            'Item of,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'The Day',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),


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
                          height:80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.yellow.shade100,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(

                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: <Widget>[
                                          new Text(
                                            'Buy 1,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'GET 1 FREE',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),



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
                    )
                ),
                _verticalDivider(),
                Divider(),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        _verticalDivider(),
                        Text(
                          'DISCOUNT',
                          style: TextStyle(
                            //color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    )
                ),
                Container(
                    height: 90.0,
                    margin: EdgeInsets.only(top: 5.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height:80.0,

                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: <Widget>[
                                          new Text(
                                            '10%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),




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
                          height:80.0,

                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: <Widget>[
                                          new Text(
                                            '20%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),




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
                          height:80.0,

                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: <Widget>[
                                          new Text(
                                            '30%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),




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
                          height:80.0,

                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: <Widget>[
                                          new Text(
                                            '40%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          _verticalDivider(),
                                          new Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),




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
                    )
                ),
                _verticalDivider(),
                Divider(),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        _verticalDivider(),
                        Text(
                          'AVAILIBILITY',
                          style: TextStyle(
                            //color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    )
                ),
                _verticalDivider(),
                Container(
                    child: Align(
                      //alignment: const Alignment(0.0, -0.2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            _verticalDivider(),
                            Radio<int>(
                                value: 0,
                                groupValue: radioValue,
                                onChanged: handleRadioValueChanged
                            ),

                            Text(
                              'Available for this location',
                              style: TextStyle(
                                //color: Colors.black54,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                    )
                ),
              ]
          ),
        ),
      );
    })
        .closed.whenComplete(() {
      if (mounted) {
        setState(() { // re-enable the button
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }

  int radioValue = 0;
  bool switchValue = false;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  _verticalDivider() =>
      Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() =>
      Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
