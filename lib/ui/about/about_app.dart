import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class AboutAppTabPage extends StatelessWidget {

  String appName;
  String packageName;
  String version;
  String buildNumber;

  AboutAppTabPage() {
    asyncFunction().then((packageInfo) {
      this.appName = packageInfo.appName;
      this.packageName = packageInfo.packageName;
      this.version = packageInfo.version;
      this.buildNumber = packageInfo.buildNumber;
    });
  }

  Future<PackageInfo> asyncFunction() async {
    //int val = await otherFunction();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //_buildAppInfo(context),
            _buildLegalInfo(context),
          ],
        ),
      ),
    );
  }

  _buildAppInfo(context) {
    return AboutListTile(
      applicationIcon: FlutterLogo(
        colors: Colors.yellow,
      ),
      icon: FlutterLogo(
        colors: Colors.yellow,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Developed By Kevin Omyonga",
        ),
      ],
      applicationName: UIConstants.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }

  _buildLegalInfo(context) {

    return Container(
      child: Column(
        //padding: EdgeInsets.only(bottom: 7.0),
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
                                  Icons.copyright,
                                  //color: Colors.black54
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                ),
                                Text(
                                  'Software Licenses',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    //color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              showLicensePage(context: context);
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

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
  );

  void showLicensePage({
    @required BuildContext context,
    String applicationName,
    String applicationVersion,
    Widget applicationIcon,
    String applicationLegalese
  }) {
    assert(context != null);
    Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context) => LicensePage(
            applicationName: UIConstants.appName,
            applicationVersion: version + '(' + buildNumber + ')',
            applicationLegalese: UIConstants.appLegalese
        )
    ));
  }
}
