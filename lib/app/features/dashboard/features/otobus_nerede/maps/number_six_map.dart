//Way point doğru rota oluşturuldu adamı Boyle sikerler

import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class NumberSixMap extends StatefulWidget {
  final String userId;

  const NumberSixMap(this.userId, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberSixMapState createState() => _NumberSixMapState();
}

class _NumberSixMapState extends State<NumberSixMap> {
  final loc.Location location = loc.Location();
  final Set<Marker> markers = {};
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final bool _added = false;
  final wayPoints = [
    PolylineWayPoint(location: "40.649835, 35.795758"),
    PolylineWayPoint(location: "40.650540, 35.797761"),
    PolylineWayPoint(location: "40.651675, 35.800865"),
    PolylineWayPoint(location: "40.652876, 35.803558"),
    PolylineWayPoint(location: "40.651299, 35.805962"),
    PolylineWayPoint(location: "40.646641, 35.810475"),
    PolylineWayPoint(location: "40.643452, 35.808433"),
    PolylineWayPoint(location: "40.637473, 35.808831"),
    PolylineWayPoint(location: "40.616501, 35.813611"),
    PolylineWayPoint(location: "40.602087, 35.809871"),
    PolylineWayPoint(location: "40.606744, 35.812118"),
    PolylineWayPoint(location: "40.603355, 35.818920"),
    PolylineWayPoint(location: "40.607146, 35.812102"),
    PolylineWayPoint(location: "40.617396, 35.814808"),
    PolylineWayPoint(location: "40.633062, 35.813166"),
    PolylineWayPoint(location: "40.646278, 35.810989"),
    PolylineWayPoint(location: "40.650200, 35.807478"),
    PolylineWayPoint(location: "40.652957, 35.803708"),
    PolylineWayPoint(location: "40.652149, 35.801709"),
    PolylineWayPoint(location: "40.650763, 35.798451"),
  ];
  final wayPointsDurakMarkers = <LatLng>[
    const LatLng(40.649835, 35.795758),
    const LatLng(40.650540, 35.797761),
    const LatLng(40.651675, 35.800865),
    const LatLng(40.652876, 35.803558),
    const LatLng(40.651299, 35.805962),
    const LatLng(40.646641, 35.810475),
    const LatLng(40.643452, 35.808433),
    const LatLng(40.637473, 35.808831),
    const LatLng(40.616501, 35.813611),
    const LatLng(40.602087, 35.809871),
    const LatLng(40.606744, 35.812118),
    const LatLng(40.603355, 35.818920), // startdan amasyaya gelis
    const LatLng(40.607146, 35.812102),
    const LatLng(40.617396, 35.814808),
    const LatLng(40.633062, 35.813166),
    const LatLng(40.646278, 35.810989),
    const LatLng(40.650200, 35.807478),
    const LatLng(40.652957, 35.803708),
    const LatLng(40.652149, 35.801709),
    const LatLng(40.650763, 35.798451),
  ];

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
          polylines: Set<Polyline>.of(polylines.values),
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['latitudeStart'],
              snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitudeStart'],
            ),
            zoom: 12.5,
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

  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 3,
    );
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

  Set<Marker> getMarkers(
      double markerLatitude, double markerLongitude, double markerLatitudeStart, double markerLongitudeStart) {
    Set<Marker> markers = {};

    markers.add(
      Marker(
        markerId: const MarkerId("markerId2"),
        position: LatLng(
          markerLatitude,
          markerLongitude,
        ),
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), //Icon for Marker
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId("markerIdStart"),
        position: LatLng(
          markerLatitudeStart,
          markerLongitudeStart,
        ),
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), //Icon for Marker
      ),
    );
    for (var i = 0; i < wayPointsDurakMarkers.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId("markerIdWayPoint$i"),
          position: LatLng(
            wayPointsDurakMarkers[i].latitude,
            wayPointsDurakMarkers[i].longitude,
          ),
          infoWindow: InfoWindow(
            title: ' ${i + 1}.Durak ',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }
    return markers;
  }
}
