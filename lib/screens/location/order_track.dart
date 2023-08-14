import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// ignore: must_be_immutable
class OrderTrackingPage extends StatefulWidget {
  OrderTrackingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  double latitude = 30.5280359;
  double longitude = 31.0461196;
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(30.5280359, 31.0461196);
  static const LatLng destination = LatLng(30.5280359, 31.0461196);
  List<LatLng> polylineCoordinates = [];

  String google_api_key = "AIzaSyAJXUVWDIhTyFGDqIx67_wB6yWtGVpOH_U";
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                30.5280359,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       body: GoogleMap(
//   initialCameraPosition: const CameraPosition(
//     target: sourceLocation,
//     zoom: 13.5,
//   ),
//   markers: {
//     const Marker(
//       markerId: MarkerId("source"),
//       position: sourceLocation,
//     ),
//     const Marker(
//       markerId: MarkerId("destination"),
//       position: destination,
//     ),
//   },
//   onMapCreated: (mapController) {
//     _controller.complete(mapController);
//   },
//     polylines: {
//     Polyline(
//       polylineId: const PolylineId("route"),
//       points: polylineCoordinates,
//       color: const Color(0xFF7B61FF),
//       width: 6,
//     ),
//   },
// ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(30.5280359, 31.0461196),
                zoom: 13.5,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: LatLng(30.5280359, 31.0461196),
                ),
                const Marker(
                  markerId: MarkerId("source"),
                  position: sourceLocation,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                ),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
    );
  }
}
