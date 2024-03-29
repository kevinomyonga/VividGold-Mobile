import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vividgold_app/components/map.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/widgets/description_text.dart';

class AboutStoreTabPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AboutStoreTabPageState();
}

class AboutStoreTabPageState extends State<AboutStoreTabPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static String phone = "+123456789";
  var whatsappUrl ="whatsapp://send?phone=$phone";

  LatLng storeLocation = LatLng(-1.284637, 36.826658);
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _add();
  }

  void _add() {
    var markerIdVal = UIConstants.store_name;
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: storeLocation,
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      _markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: new Center(
        child:  new SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            children: <Widget>[
              _buildStoreDescInfo(context),
              _buildStoreLocationInfo(context),
              _buildSocialMediaLinks(context),
              new SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildStoreDescInfo(context) {

    String description = UIConstants.store_desc;

    return new Container(
      margin: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new DescriptionTextWidget(
            text: description,
            textColor: Colors.white,
            textSize: 16.0,
          ),
        ],
      ),
    );
  }

  _buildStoreLocationInfo(context) {
    return Card(
      elevation: 4.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: MapCard(
              center: storeLocation,
              mapController: _mapController,
              onMapCreated: _onMapCreated,
              markers: _markers,
              height: 240.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0, right: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Flexible(
                  child: Text(
                    UIConstants.store_physical_address,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  _buildSocialMediaLinks(BuildContext context) {

    return new Container(
      margin: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "WebsiteTag",
                  child: const Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.brandColor,
                  onPressed: () {
                    _launchURL(UIConstants.store_website);
                    showInSnackBar("Website button pressed", UIColors.brandColor);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "FacebookTag",
                  child: const Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.facebookColor,
                  onPressed: () {
                    _launchURL(UIConstants.store_facebookUrl);
                    showInSnackBar("Facebook button pressed", UIColors.facebookColor);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "InstagramTag",
                  child: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.instagramColor,
                  onPressed: () {
                    _launchURL(UIConstants.store_instagramUrl);
                    showInSnackBar("Instagram button pressed", UIColors.instagramColor);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "LinkedInTag",
                  child: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.linkedInColor,
                  onPressed: () {
                    _launchURL(UIConstants.store_linkedInUrl);
                    showInSnackBar("LinkedIn button pressed", UIColors.linkedInColor);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "TwitterTag",
                  child: const Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.twitterColor,
                  onPressed: () {
                    _launchURL(UIConstants.store_twitterUrl);
                    showInSnackBar("Twitter button pressed", UIColors.twitterColor);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "YouTubeTag",
                  child: const Icon(
                    FontAwesomeIcons.youtube,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.youtubeColor,
                  onPressed: () {
                    _launchURL(UIConstants.store_youtubeUrl);
                    showInSnackBar("YouTube button pressed", UIColors.youtubeColor);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: "WhatsAppTag",
                  child: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                  ),
                  backgroundColor: UIColors.whatsappColor,
                  onPressed: () {
                    _launchURL(whatsappUrl);
                    showInSnackBar("WhatApp button pressed", UIColors.whatsappColor);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showInSnackBar(String value, Color color) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          //fontFamily: "WorkSansSemiBold"
        ),
      ),
      backgroundColor: color,
      duration: Duration(seconds: 3),
    ));
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

