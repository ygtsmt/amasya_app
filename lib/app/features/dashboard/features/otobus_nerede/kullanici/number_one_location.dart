
import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class NumberOneLocation extends StatefulWidget {
  const NumberOneLocation({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberOneLocationState createState() => _NumberOneLocationState();
}

class _NumberOneLocationState extends State<NumberOneLocation> {
  final Dio _dio = Dio();
  String dlatitude = "40.659990";
  String dlongitude = "35.840260";
  String slatitude = "40.657410";
  String slongitude = "35.838458";
  final loc.Location location = loc.Location();
  final Set<Marker> markers = {};
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final wayPoints = [
    PolylineWayPoint(location: "40.659990, 35.840260"),
    PolylineWayPoint(location: "40.655381, 35.836891"),
    PolylineWayPoint(location: "40.650584, 35.830444"),
    PolylineWayPoint(location: "40.648980, 35.816248"),
    PolylineWayPoint(location: "40.632924, 35.812836"),
    PolylineWayPoint(location: "40.635513, 35.810789"),
    PolylineWayPoint(location: "40.643598, 35.809132"),
    PolylineWayPoint(location: "40.649832, 35.819838"),
    PolylineWayPoint(location: "40.657410, 35.838458"),
  ];
  final wayPointsDurakMarkers = <LatLng>[
    const LatLng(40.659990, 35.840260),
    const LatLng(40.655381, 35.836891),
    const LatLng(40.650584, 35.830444),
    const LatLng(40.648980, 35.816248),
    const LatLng(40.632924, 35.812836),
    const LatLng(40.635513, 35.810789),
    const LatLng(40.643598, 35.809132),
    const LatLng(40.649832, 35.819838),
    const LatLng(40.657410, 35.838458),
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
  Future<void> calculateEstimatedArrivalTime(List<String> waypoints) async {
    String start = "40.659990, 35.840260";
    String destination = "40.643598, 35.809132";
    String waypointString = waypoints.join("|");

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$start&destination=$destination&waypoints=$waypointString&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM";

    Response response = await Dio().get(url);
    Map<String, dynamic> responseData = response.data;

    if (responseData['status'] == 'OK') {
      List<dynamic> routes = responseData['routes'];
      if (routes.isNotEmpty) {
        Map<String, dynamic> route = routes[0];
        Map<String, dynamic> legs = route['legs'][0];

        double duration = legs['duration']['value'] / 60.0; // Süreyi dakika cinsinden al
        print('Tahmini Varış Süresi: $duration dakika');
      }
    } else {
      print('Hesaplama yapılamadı. Hata Kodu: ${responseData['status']}');
    }
  }

  double startLatitude = 40.1234;
  double startLongitude = 30.5678;
  double destinationLatitude = 40.9876;
  double destinationLongitude = 30.4321;
  List<String> waypoints = [
  "40.655381, 35.836891"
"40.650584, 35.830444"
"40.648980, 35.816248"
"40.632924, 35.812836"
  ];

  @override
  void initState() {
    getMarkerIcons();
    calculateEstimatedArrivalTime(waypoints);
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
 /*    Response response = await _dio.get(
        "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$dlatitude,$dlongitude&origins=$slatitude,$slongitude&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM");
    debugPrint(response.data.toString()); */
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

            return GoogleMap(
              polylines: Set<Polyline>.of(polylines.values),
              zoomGesturesEnabled: true,
              // ...
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")['latitudeTarget'],
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")['longitudeTarget'],
                ),
                zoom: 12.5,
              ),
              markers: getMarkersFromUserSnapshot(userSnapshot.data!.docs,
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")),
              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                  makeLines(
                    PointLatLng(
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")['latitudeStart'],
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")['longitudeStart'],
                    ), // Starting LATLANG
                    PointLatLng(
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")['latitudeTarget'],
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara1")['longitudeTarget'],
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
    Polyline polyline = Polyline(polylineId: id, color: Colors.blue, points: polylineCoordinates, width: 3);
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
      //optimizeWaypoints: true
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
      bool isActive = userDoc['isActiveLocationNumara1'];
      if (isActive && userDoc['numara1KonumLatitude'] != null) {
        double latitude = userDoc['numara1KonumLatitude'];
        double longitude = userDoc['numara1KonumLongitude'];

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
