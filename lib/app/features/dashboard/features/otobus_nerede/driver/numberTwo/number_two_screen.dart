import 'dart:async';

import 'package:amasyaapp/app/features/dashboard/features/otobus_nerede/maps/number_two_map.dart';
import 'package:amasyaapp/app/ui/widgets/location_service_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class NumberTwoScreen extends StatefulWidget {
  const NumberTwoScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _NumberTwoScreenState createState() => _NumberTwoScreenState();
}

class _NumberTwoScreenState extends State<NumberTwoScreen> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  @override
  void initState() {
    super.initState();
    _requestPermission();
    // location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LocationServiceButton(
          onPressed: () {
            _listenLocation2();
          },
          title: "Sefere Başlıyorum Konumumu Paylaş",
          description: "2 numaralı otobüsle yaptığınız  seferin konum bilgisi bütün kullanıcılarla paylaşılacaktır."),
      const Divider(),
      LocationServiceButton(
          onPressed: () {
            _stopListening2();
          },
          title: "Seferi Tamamladım ve ya Sefere Devam Edemiyorum Konum Paylaşımını Durdur",
          description: "Yalnızca seferi tamamladıysanız ve ya sefere devam edemiyorsanız konum paylaşımını durdurun."),
      const Divider(),
      const Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberTwoMap('numara2'),
        ),
      )
    ]);
  }

  Future<void> _listenLocation2() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      debugPrint(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('guzergahlar').doc('numara2').set({
        'latitudeKonum': currentlocation.latitude,
        'longitudeKonum': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }

  _stopListening2() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      debugPrint('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
