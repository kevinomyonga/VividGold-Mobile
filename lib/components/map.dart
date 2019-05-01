import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCard extends StatelessWidget {
  const MapCard({
    @required this.center,
    @required this.mapController,
    @required this.onMapCreated,
    @required this.markers,
    @required this.height,
    Key key,
  })
      : assert(center != null),
        assert(onMapCreated != null),
        super(key: key);

  final LatLng center;
  final GoogleMapController mapController;
  final ArgumentCallback<GoogleMapController> onMapCreated;
  final Map<MarkerId, Marker> markers;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: const EdgeInsets.symmetric(vertical: 0.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 0.0,
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: height,
        child: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 16.0,
          ),
          markers: Set<Marker>.of(markers.values),
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          scrollGesturesEnabled: false,
        ),
      ),
    );
  }
}
