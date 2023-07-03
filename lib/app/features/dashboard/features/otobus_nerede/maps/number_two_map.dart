//Way point doğru rota oluşturuldu adamı Boyle sikerler

import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class NumberTwoMap extends StatefulWidget {
  final String userId;

  const NumberTwoMap(this.userId, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberTwoMapState createState() => _NumberTwoMapState();
}

class _NumberTwoMapState extends State<NumberTwoMap> {
  final loc.Location location = loc.Location();
  final Set<Marker> markers = {};
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final bool _added = false;
  // final wayPoints = [
  //   PolylineWayPoint(location: "40.650988, 35.825864"),
  // ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('guzergahlar').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (_added) {}
        if (!snapshot.hasData) {
          return const Center(child: AppleProgressIndicator());
        }
        return GoogleMap(
          //myLocationEnabled: true,
          polylines: Set<Polyline>.of(polylines.values),
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitudeStart'],
              snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitudeStart'],
            ), //initial position
            zoom: 12.0, //initial zoom level
          ),
          markers: getMarkers(
            snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitudeTarget'],
            snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitudeTarget'],
            snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitudeStart'],
            snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitudeStart'],
          ),

          mapType: MapType.normal, //map type
          onMapCreated: (controller) {
            //method called when map is created
            setState(() {
              mapController = controller;
              makeLines(
                PointLatLng(
                  snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitudeStart'],
                  snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitudeStart'],
                ), // Starting LATLANG
                PointLatLng(
                  snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitudeTarget'],
                  snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitudeTarget'],
                ), // End LATLANG
              );
            });
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
            // travelMode: TravelMode.driving,
            // wayPoints: wayPoints,
            // optimizeWaypoints: true
            )
        .then((value) {
      for (var point in value.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }).then((value) {
      addPolyLine();
    });
  }

  Set<Marker> getMarkers(
      double markerLatitude, double markerLongitude, double markerLatitudeStart, double markerLongitudeStart) {
    Set<Marker> markers = {};
/* 
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
    ); */

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

    //add more markers here

    return markers;
  }
}
