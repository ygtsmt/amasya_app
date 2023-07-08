//Way point doğru rota oluşturuldu adamı Boyle sikerler

// ignore_for_file: avoid_print

import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class NumberSixLocation extends StatefulWidget {
  const NumberSixLocation({super.key});
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
    PolylineWayPoint(location: "40.606744, 35.812118"), //11
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
    const LatLng(40.603355, 35.818920),
    const LatLng(40.607146, 35.812102),
    const LatLng(40.617396, 35.814808),
    const LatLng(40.633062, 35.813166),
    const LatLng(40.646278, 35.810989),
    const LatLng(40.650200, 35.807478),
    const LatLng(40.652957, 35.803708),
    const LatLng(40.652149, 35.801709),
    const LatLng(40.650763, 35.798451),
  ];
  // BitmapDescriptor? icon;
  List<String> imagePaths = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/15.png',
    'assets/images/16.png',
    'assets/images/17.png',
    'assets/images/18.png',
    'assets/images/19.png',
    'assets/images/20.png',
  ];
  List<BitmapDescriptor> markerIcons = [];
  /* void getDirections() async {
    try {
      String origin = '40.685112, 35.893150';
      String destination = '40.646664, 35.812732';
      List<String> waypoints = ['40.673402, 35.860482'];

      String url = 'https://maps.googleapis.com/maps/api/directions/json?'
          'origin=$origin'
          '&destination=$destination'
          '&waypoints=${waypoints.join('|')}'
          '&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM';

      var response = await Dio().get(url);

      // debugPrint(response.data);
    } catch (e) {
      // debugPrint(e.toString()); //print(e)
    }
  } */

  void getDistanceMatrix() async {
    try {
      var response = await Dio().get(
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=40.602677,35.818931&origins=40.649898,35.794376|40.652977,35.803939&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM');
      print(response);
      debugPrint("response");
    } catch (e) {
      print(e);
    }
  }

  List<String> waypoints = ["40.643466, 35.808822", "40.649737, 35.826969"];
  @override
  void initState() {
    getMarkerIcons();
    // getDirections();
    getDistanceMatrix();
    super.initState();
  }

  Future<Uint8List?> compressImage(String imagePath) async {
    final ByteData bytes = await rootBundle.load(imagePath);
    final Uint8List imageData = bytes.buffer.asUint8List();

    final compressedImageData = await FlutterImageCompress.compressWithList(imageData,
        format: CompressFormat.png, minWidth: 50, minHeight: 50, inSampleSize: 2);

    return compressedImageData;
  }

  Future<void> getMarkerIcons() async {
    for (String imagePath in imagePaths) {
      final compressedImageData = await compressImage(imagePath);
      if (compressedImageData != null) {
        final BitmapDescriptor markerIcon = BitmapDescriptor.fromBytes(compressedImageData);
        markerIcons.add(markerIcon);
      }
    }
    setState(() {});
  }

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

            return Column(
              children: [
                const AmasyaScreenHeader(title: "6 NUMARA CANLI HARİTA"),
                Expanded(
                  child: GoogleMap(
                    polylines: Set<Polyline>.of(polylines.values),
                    zoomGesturesEnabled: true,
                    // ...
                    initialCameraPosition: CameraPosition(
                      // bearing: ,
                      tilt: 90,
                      target: LatLng(
                        guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")['latitudeStart'],
                        guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")['longitudeStart'],
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
                  ),
                ),
              ],
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
    )
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
      bool isActive = userDoc['isActiveLocationNumara6'];
      if (isActive && userDoc['numara6KonumLatitude'] != null) {
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
            zIndex: 1,
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
    for (var i = 0; i < wayPointsDurakMarkers.length; i++) {
      int markerIconIndex = i % markerIcons.length;
      BitmapDescriptor? markerIcon = markerIcons.isNotEmpty ? markerIcons[markerIconIndex] : null;
      markers.add(
        Marker(
          markerId: MarkerId("markerIdWayPoint$i"),
          position: LatLng(
            wayPointsDurakMarkers[i].latitude,
            wayPointsDurakMarkers[i].longitude,
          ),
          infoWindow: InfoWindow(
            title: ' ${i + 300}',
          ),
          icon: markerIcon!,
        ),
      );
    }
    return markers;
  }
}
