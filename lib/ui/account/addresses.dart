import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vividgold_app/components/addresses.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class AddressesPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AddressesPageState();
}

class AddressesPageState extends State<AddressesPage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          title: Text(UIConstants.my_addresses),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: const Icon(
            Icons.add_location,
            semanticLabel: UIConstants.add_addresses,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: _buildAddressesPage(context)
    );
  }

  _buildAddressesPage(context) {

    return new ListView(
      children: <Widget>[
        //grid view
        Container(
          child: Addresses(),
        )
      ],
    );

    /*return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      initialCameraPosition: _initialCamera,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );*/
  }
}
