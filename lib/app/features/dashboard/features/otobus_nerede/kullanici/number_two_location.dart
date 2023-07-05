//Way point doğru rota oluşturuldu adamı Boyle sikerler

import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class NumberTwoLocation extends StatefulWidget {
  const NumberTwoLocation({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberTwoLocationState createState() => _NumberTwoLocationState();
}

class _NumberTwoLocationState extends State<NumberTwoLocation> {
  final loc.Location location = loc.Location();
  final Set<Marker> markers = {};
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final wayPoints = [
    PolylineWayPoint(location: "40.654529, 35.824460"),
    PolylineWayPoint(location: "40.655479, 35.817855"),
    PolylineWayPoint(location: "40.656164, 35.814589"),
    PolylineWayPoint(location: "40.656156, 35.805069"),
    PolylineWayPoint(location: "40.657481, 35.797461"),
    PolylineWayPoint(location: "40.659366, 35.796121"),
    PolylineWayPoint(location: "40.657457, 35.796084"),
    PolylineWayPoint(location: "40.657420, 35.800458"),
    PolylineWayPoint(location: "40.655866, 35.805775"),
    PolylineWayPoint(location: "40.655902, 35.816203"),
    PolylineWayPoint(location: "40.655372, 35.833524"),
  ];
  final wayPointsDurakMarkers = <LatLng>[
    const LatLng(40.654529, 35.824460),
    const LatLng(40.655479, 35.817855),
    const LatLng(40.656164, 35.814589),
    const LatLng(40.656156, 35.805069),
    const LatLng(40.657481, 35.797461),
    const LatLng(40.659366, 35.796121),
    const LatLng(40.657457, 35.796084),
    const LatLng(40.657420, 35.800458),
    const LatLng(40.655866, 35.805775),
    const LatLng(40.655902, 35.816203),
    const LatLng(40.655372, 35.833524),
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
  @override
  void initState() {
    getMarkerIcons();
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

            return GoogleMap(
              polylines: Set<Polyline>.of(polylines.values),
              zoomGesturesEnabled: true,
              // ...
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")['latitudeTarget'],
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")['longitudeTarget'],
                ),
                zoom: 12.5,
              ),
              markers: getMarkersFromUserSnapshot(userSnapshot.data!.docs,
                  guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")),
              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                  makeLines(
                    PointLatLng(
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")['latitudeStart'],
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")['longitudeStart'],
                    ), // Starting LATLANG
                    PointLatLng(
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")['latitudeTarget'],
                      guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara2")['longitudeTarget'],
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
      bool isActive = userDoc['isActiveLocationNumara2'];
      if (isActive && userDoc['numara2KonumLatitude'] != null) {
        double latitude = userDoc['numara2KonumLatitude'];
        double longitude = userDoc['numara2KonumLongitude'];

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
