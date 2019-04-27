import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/widgets/platform_switch.dart';

class SettingsPage extends StatefulWidget {
  final String toolbarName;

  SettingsPage({Key key, this.toolbarName}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingsPageState(toolbarName);
}

class SettingsPageState extends State<SettingsPage> {
  List list = ['12', '11'];

  bool switchValue = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String toolbarName;

  SettingsPageState(this.toolbarName);

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
            tooltip: UIConstants.back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(UIConstants.settings),
          //backgroundColor: Colors.white,
        ),
        body: _buildSettingsPage(context)
    );
  }

  _buildSettingsPage(context) {

    bool darkThemeEnabled = Theme.of(context).brightness == Brightness.dark? true: false;

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
    theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return Container(
      child: ListView(
        padding: EdgeInsets.only(bottom: 7.0),
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
                    'Theme',
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
                  padding: EdgeInsets.only(
                      left: 10.0, top: 5.0, bottom: 5.0, right: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.brightness_4,
                            //color: Colors.black54
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                          ),
                          Text(
                            'Dark Theme',
                            style: TextStyle(
                              fontSize: 17.0,
                              //color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      PlatformSwitch(
                          value: darkThemeEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              darkThemeEnabled = value;
                            });
                            changeBrightness();
                          }
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
          ),

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
                    UIConstants.notifications,
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
                  padding: EdgeInsets.only(
                      left: 10.0, top: 5.0, bottom: 5.0, right: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            //color: Colors.black54
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                              fontSize: 17.0,
                              //color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      PlatformSwitch
                        (
                          value: switchValue,
                          onChanged: (bool value) {
                            setState(() {
                              switchValue = value;
                            });
                          }
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
          ),
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
                    'Legal',
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
                                  Icons.assignment,
                                  //color: Colors.black54
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                ),
                                Text(
                                  'Terms Of Use',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    //color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                            },
                          )),
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
                                    Icons.lock_outline,
                                    //color: Colors.black54
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                  ),
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      //color: Colors.black87
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                              })),
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
    if (status == 'Cancel Order') {
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

  verticalD() => Container(
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

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: Colors.indigo
    ));
  }
}
