import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/cart/cart.dart';

class HelpPage extends StatefulWidget {
  final String toolbarname;

  HelpPage({Key key, this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HelpPageState(toolbarname);
}

class HelpPageState extends State<HelpPage> {
  List list = ['12', '11'];

  bool switchValue = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String toolbarName;

  HelpPageState(this.toolbarName);

  @override
  Widget build(BuildContext context) {

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

    final Orientation orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(_backIcon()),
            alignment: Alignment.centerLeft,
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(toolbarName),
        ),
        body: _buildHelpPage(context)
    );
  }

  _buildHelpPage(context) {

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
    theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return Container(
      child: Column(
        children: <Widget>[

          new Container(
            height: 50.0,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 7.0),
            child: new Row(
              children: <Widget>[
                _verticalD(),
                new GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup_screen()));*/
                  },
                  child: new Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 18.0,
                        //color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Card(
                child: Container(
                  //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.mail,
                                  //color: Colors.black54
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                ),
                                Text(
                                  'Email US',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    //color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                            },
                          )
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.info,
                                    //color: Colors.black54
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                  ),
                                  Text(
                                    'About US',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      //color: Colors.black87
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                              }
                          )
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.feedback,
                                    //color: Colors.black54
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                  ),
                                  Text(
                                    'Send Feedback',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      //color: Colors.black87
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                              }
                          )
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        /*_scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('You selected: $value')
        ));*/
      }
    });
  }

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
  );

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  Widget _status(status) {
    if (status == 'Cabcel Order') {
      return FlatButton.icon(
          label: Text(
            status,
            style: TextStyle(color: Colors.red),
          ),
          icon: const Icon(
            Icons.highlight_off,
            size: 18.0,
            color: Colors.red,
          ),
          onPressed: () {
            // Perform some action
          });
    } else {
      return FlatButton.icon(
          label: Text(
            status,
            style: TextStyle(color: Colors.green),
          ),
          icon: const Icon(
            Icons.check_circle,
            size: 18.0,
            color: Colors.green,
          ),
          onPressed: () {
            // Perform some action
          });
    }
  }

  erticalD() => Container(
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
