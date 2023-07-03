//Way point doğru rota oluşturuldu adamı Boyle sikerler

import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class NumberSixLocation extends StatefulWidget {

  const NumberSixLocation( {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberSixLocationState createState() => _NumberSixLocationState();
}

class _NumberSixLocationState extends State<NumberSixLocation> {
  final loc.Location location = loc.Location();
  final Set<Marker> markers = {};
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final wayPoints = [
    PolylineWayPoint(location: "40.653107, 35.804547"),
    PolylineWayPoint(location: "40.606683, 35.812084"),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('guzergahlar').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> guzergahSnapshot) {
        if (!guzergahSnapshot.hasData) {
          return const Center(child: AppleProgressIndicator());
        }

        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> userSnapshot) {
            if (!userSnapshot.hasData) {
              return const Center(child: AppleProgressIndicator());
            }

            return GoogleMap(
              polylines: Set<Polyline>.of(polylines.values),
              zoomGesturesEnabled: true,
              // ...
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")['latitudeTarget'],
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")['longitudeTarget'],
                ),
                zoom: 12.5,
              ),
              markers: getMarkersFromUserSnapshot(userSnapshot.data!.docs,
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")),
              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                  makeLines(
                    PointLatLng(
                      guzergahSnapshot.data!.docs
                          .singleWhere((element) => element.id == "numara6")['latitudeStart'],
                      guzergahSnapshot.data!.docs
                          .singleWhere((element) => element.id == "numara6")['longitudeStart'],
                    ), // Starting LATLANG
                    PointLatLng(
                      guzergahSnapshot.data!.docs
                          .singleWhere((element) => element.id == "numara6")['latitudeTarget'],
                      guzergahSnapshot.data!.docs
                          .singleWhere((element) => element.id == "numara6")['longitudeTarget'],
                    ), // End LATLANG
                  );
                });
              },
           
            );
          },
        );
      },
    );
  }



//POLYLINES OLDU DURAKLARI
  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: Colors.blue, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  void makeLines(PointLatLng startingLatLng, PointLatLng endLatLng) async {
    await polylinePoints
        .getRouteBetweenCoordinates(
            'AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM',
            startingLatLng, //Starting LATLANG
            endLatLng, //End LATLANG

            travelMode: TravelMode.driving,
            wayPoints: wayPoints,
            optimizeWaypoints: true)
        .then((value) {
      for (var point in value.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }).then((value) {
      addPolyLine();
    });
  }

  Set<Marker> getMarkersFromUserSnapshot(List<QueryDocumentSnapshot> userDocs, QueryDocumentSnapshot guzergahDoc) {
    Set<Marker> markers = {};

    for (var userDoc in userDocs) {
      if (userDoc['numara6KonumLatitude'] != null) {
        double latitude = userDoc['numara6KonumLatitude'];
        double longitude = userDoc['numara6KonumLongitude'];

        markers.add(
          Marker(
            markerId: MarkerId(userDoc.id),
            position: LatLng(latitude, longitude),
            infoWindow: const InfoWindow(
              title: 'Marker Title',
              snippet: 'My Custom Subtitle',
            ),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      }
    }
    double markerLatitudeStart = guzergahDoc['latitudeStart'];
    double markerLongitudeStart = guzergahDoc['longitudeStart'];
    double markerLatitudeTarget = guzergahDoc['latitudeTarget'];
    double markerLongitudeTarget = guzergahDoc['longitudeTarget'];

    markers.add(
      Marker(
        markerId: const MarkerId("markerIdStart"),
        position: LatLng(markerLatitudeStart, markerLongitudeStart),
        infoWindow: const InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId("markerIdStart"),
        position: LatLng(markerLatitudeTarget, markerLongitudeTarget),
        infoWindow: const InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      ),
    );

    return markers;
  }

  /*  Set<Marker> getMarkers(double latitude, double longitude, double markerLatitude, double markerLongitude,
      double markerLatitudeStart, double markerLongitudeStart) {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        //add first marker
        markerId: const MarkerId("markerId1"),
        position: LatLng(
          latitude,
          longitude,
        ), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ),
    );

    markers.add(
      Marker(
        //add second marker
        markerId: const MarkerId("markerId2"),
        position: LatLng(
          markerLatitude,
          markerLongitude,
        ), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), //Icon for Marker
      ),
    );
    markers.add(
      Marker(
        //add second marker
        markerId: const MarkerId("markerIdStart"),
        position: LatLng(
          markerLatitudeStart,
          markerLongitudeStart,
        ), //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), //Icon for Marker
      ),
    );
    return markers;
  } */
}
