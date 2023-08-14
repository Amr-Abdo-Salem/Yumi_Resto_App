import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Google_Map extends StatelessWidget {
  final double lat;
  final double lng;

  const Google_Map({Key? key, required this.lng, required this.lat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 5,
        ),
      ),
    );
  }
}
