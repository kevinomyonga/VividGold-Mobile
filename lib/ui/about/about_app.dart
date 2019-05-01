import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class AboutAppTabPage extends StatefulWidget {

  static String appName;
  static String packageName;
  static String version;
  static String buildNumber;

  AboutAppTabPage() {
    asyncFunction().then((packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  Future<PackageInfo> asyncFunction() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  @override
  State<StatefulWidget> createState() => AboutAppTabPageState();
}

class AboutAppTabPageState extends State<AboutAppTabPage> {

  /*String appName;
  String packageName;
  String version;
  String buildNumber;

  AboutAppTabPageState() {
    asyncFunction().then((packageInfo) {
      this.appName = packageInfo.appName;
      this.packageName = packageInfo.packageName;
      this.version = packageInfo.version;
      this.buildNumber = packageInfo.buildNumber;
    });
  }

  Future<PackageInfo> asyncFunction() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Center(
        child:  new SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            children: <Widget>[
              _buildAppInfo(context),
              _buildLegalInfo(context),
              _buildMoreInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppInfo(context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 25.0,
          ),
          Container(
            width: 120.0,
            height: 120.0,
            margin: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              //shape: BoxShape.circle,
              //color: Colors.grey,
              image: new DecorationImage(
                image: new ExactAssetImage(UIConstants.loginLogo),
                fit: BoxFit.contain,
              ),
            ),
          ),
          new SizedBox(
            height: 25.0,
          ),
          new Text(
              UIConstants.appName + ' Mobile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
              )
          ),
          new SizedBox(
            height: 25.0,
          ),
          new Text(
              'Version ' + AboutAppTabPage.version + ' (' + AboutAppTabPage.buildNumber + ')',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              )
          ),
          new SizedBox(
            height: 25.0,
          ),
          new Text(
              UIConstants.appLegalese,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              )
          ),
          new SizedBox(
            height: 40.0,
          ),
        ],
      ),
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
                      InkWell(
                        onTap: () {
                          showLicensePage(context: context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
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
                                UIConstants.software_licenses,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  //color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      InkWell(
                          onTap: () {
                            _launchURL("https://vividgold.co.ke/legal/");
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 15.0, bottom: 15.0),
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
                                  UIConstants.terms_of_use,
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    //color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      InkWell(
                          onTap: () {
                            _launchURL("https://vividgold.co.ke/legal/");
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 15.0, bottom: 15.0),
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
                                  UIConstants.privacy_policy,
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    //color: Colors.black87
                                  ),
                                ),
                              ],
                            ),
                          )
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

  _buildMoreInfo(context) {

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
                    UIConstants.more,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
                      InkWell(
                        onTap: () {
                          _sendFeedback();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
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
                                UIConstants.send_feedback,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  //color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          _tellAFriend();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                //color: Colors.black54
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                              ),
                              Text(
                                UIConstants.tell_a_friend,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  //color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          _rateTheApp();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.rate_review,
                                //color: Colors.black54
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                              ),
                              Text(
                                UIConstants.rate_the_app,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  //color: Colors.black87
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
          new SizedBox(
            height: 25.0,
          ),
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
            applicationVersion: AboutAppTabPage.version + ' (' + AboutAppTabPage.buildNumber + ')',
            applicationLegalese: UIConstants.appLegalese
        )
    ));
  }

  _tellAFriend() {
    Share.share('Check out my website https://example.com');
  }

  _rateTheApp() {
    LaunchReview.launch();
  }

  _sendFeedback() {
    String subject = 'VividGold App Feedback';

    String appVersion       = AboutAppTabPage.version;
    String appVersionBuild  = AboutAppTabPage.buildNumber;
    String deviceMake;
    String deviceModel;
    String deviceOSVersion;
    String carrierName;
    String deviceLanguage;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if(Platform.isAndroid) {
      getAndroidDeviceInfo(deviceInfo).then((androidInfo) {
        deviceMake = androidInfo.manufacturer;
        deviceModel = androidInfo.model;
        deviceOSVersion = androidInfo.version.toString();
        carrierName = androidInfo.model;
        deviceLanguage = androidInfo.model;
      });
    } else if (Platform.isIOS) {
      getIosInfo(deviceInfo).then((iosInfo) {
        deviceMake = iosInfo.utsname.version;
        deviceModel = iosInfo.utsname.machine;
        deviceOSVersion = iosInfo.utsname.version;
        carrierName = '';
        deviceLanguage = iosInfo.systemName.toString();
      });
    }

    String body = "\bFeedback:\b  \n\n" +
        "\n\bApp Version:\b $appVersion " +
        "\n\bApp Version Code:\b $appVersionBuild " +
        "\n\bManufacturer:\b $deviceMake " +
        "\n\bDevice:\b $deviceModel " +
        "\n\bOS Version:\b $deviceOSVersion " +
        "\n\bCarrier:\b $carrierName " +
        "\n\bLanguage:\b $deviceLanguage ";

    _launchURL('mailto:${UIConstants.store_email_address}?subject=$subject&body=$body');
  }

  Future<AndroidDeviceInfo> getAndroidDeviceInfo(deviceInfo) async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo();
    return androidInfo;
  }

  Future<IosDeviceInfo> getIosInfo(deviceInfo) async {
    IosDeviceInfo iosInfo = await deviceInfo.androidInfo();
    return iosInfo;
  }

  _launchURL(String url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
