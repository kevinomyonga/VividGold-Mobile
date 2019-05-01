import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vividgold_app/components/map.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class Addresses extends StatefulWidget {

  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {

  var addressesList = [
    {
      "name": "Delivery Address 1",
      "address": "https://vividgold.co.ke/wp-content/uploads/2018/09/PS4-Console-Pro-1TB-Black-SpiderMan.jpg",
      "lat": -1.255673,
      "lng": 36.840818,
    },
    {
      "name": "Delivery Address 2",
      "address": "https://vividgold.co.ke/wp-content/uploads/2017/10/neon-switch.png",
      "lat": -1.264080,
      "lng": 36.800948,
    },
    {
      "name": "Delivery Address 3",
      "address": "https://vividgold.co.ke/wp-content/uploads/2017/10/ps4-red1.png",
      "lat": -1.278523,
      "lng": 36.803317,
    },
    {
      "name": "Delivery Address 4",
      "address": "https://vividgold.co.ke/wp-content/uploads/2017/10/xbox-1-white-slim.jpg",
      "lat": -1.300387,
      "lng": 36.785837,
    }
  ];

  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _add();
  }

  void _add() {

    List<Widget>.generate(addressesList.length, (int index){

      var markerIdVal = addressesList[index]['name'];
      final MarkerId markerId = MarkerId(markerIdVal);

      // creating a new MARKER
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(addressesList[index]['lat'], addressesList[index]['lng']),
        infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
        onTap: () {
          //_onMarkerTapped(markerId);
        },
      );

      setState(() {
        // adding a new marker to map
        _markers[markerId] = marker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: ScrollPhysics(), // to disable GridView's scrolling
      crossAxisCount: 2,
      itemCount: addressesList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildAddressCard(context, addressesList[index]);
      },
      staggeredTileBuilder: (int index) =>
      //new StaggeredTile.count(2, index.isEven ? 2 : 1),
      new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );

    /*return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(), // to disable GridView's scrolling
        itemCount: productList.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItemCard(context, productList[index]);
        });*/
  }

  _buildAddressCard(BuildContext context, var address) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCT_DETAILS);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: MapCard(
                center: LatLng(address['lat'], address['lng']),
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
                      address['address'],
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
      ),
    );
  }
}
