import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class MyMap extends StatefulWidget {
  final String user_id;
  final String user_id_target;
  const MyMap(this.user_id, this.user_id_target, {super.key});
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  late GoogleMapController _controller2;
  final Set<Marker> markers = {};
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final bool _added = false;
  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  void makeLines() async {
    await polylinePoints
        .getRouteBetweenCoordinates(
     
      const PointLatLng(39.9730851, 32.9313301), //Starting LATLANG
      const PointLatLng(39.967572, 32.915369), //End LATLANG
      travelMode: TravelMode.driving,
    )
        .then((value) {
      for (var point in value.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }).then((value) {
      addPolyLine();
    });
  }

  @override
  void initState() {
    makeLines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/* 
markers.add(Marker( //add first marker
  markerId: MarkerId(showLocation.toString()),
  position: showLocation, //position of marker
  infoWindow: InfoWindow( //popup info 
    title: 'My Custom Title ',
    snippet: 'My Custom Subtitle',
  ),
  icon: BitmapDescriptor.defaultMarker, //Icon for Marker
));

markers.add(Marker( //add second marker
  markerId: MarkerId(showLocation.toString()),
  position: LatLng(27.7099116, 85.3132343), //position of marker
  infoWindow: InfoWindow( //popup info 
    title: 'My Custom Title ',
    snippet: 'My Custom Subtitle',
  ),
  icon: BitmapDescriptor.defaultMarker, //Icon for Marker
));  */
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('location').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        Set<Marker> getmarkers() {
          //markers to place on map

          markers.add(Marker(
            //add first marker
            markerId: const MarkerId("markerId1"),
            position: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitude'],
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['longitude'],
            ), //position of marker
            infoWindow: const InfoWindow(
              //popup info
              title: 'Marker Title First ',
              snippet: 'My Custom Subtitle',
            ),
            icon: BitmapDescriptor.defaultMarker, //Icon for Marker
          ));

          markers.add(Marker(
            //add second marker
            markerId: const MarkerId("markerId2"),
            position: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitudeTarget'],
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['longitudeTarget'],
            ), //position of marker
            infoWindow: const InfoWindow(
              //popup info
              title: 'Marker Title Second ',
              snippet: 'My Custom Subtitle',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), //Icon for Marker
          ));

          //add more markers here

          return markers;
        }

        if (_added) {}
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return GoogleMap(
          polylines: Set<Polyline>.of(polylines.values),

          //Map widget from google_maps_flutter package
          zoomGesturesEnabled: true, //enable Zoom in, out on map
          initialCameraPosition: CameraPosition(
            //innital position in map
            target: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitude'],
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['longitude'],
            ), //initial position
            zoom: 15.0, //initial zoom level
          ),
          markers: getmarkers(), //markers to show on map
          mapType: MapType.normal, //map type
          onMapCreated: (controller) {
            //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
        );
      },
    );
  }

  Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
          snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitude'],
          snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['longitude'],
        ),
        zoom: 14.47)));
  }
}
