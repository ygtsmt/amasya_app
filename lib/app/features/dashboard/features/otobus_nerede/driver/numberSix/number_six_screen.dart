import 'dart:async';

import 'package:amasyaapp/app/features/dashboard/features/otobus_nerede/maps/number_six_map.dart';
import 'package:amasyaapp/app/ui/widgets/location_service_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:amasyaapp/app/features/auth/features/login/ui/login_form.dart';

class NumberSixScreen extends StatefulWidget {
  const NumberSixScreen({super.key});
  @override
  _NumberSixScreenState createState() => _NumberSixScreenState();
}

class _NumberSixScreenState extends State<NumberSixScreen> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  // bool isStop = true;
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
            setState(() {
              // isStop = true;
            });
            _listenLocation6();
          },
          title: "Sefere Başlıyorum Konumumu Paylaş",
          description: "6 numaralı otobüsle yaptığınız  seferin konum bilgisi bütün kullanıcılarla paylaşılacaktır."),
      const Divider(),
      LocationServiceButton(
          onPressed: () {
            _stopListening6();
          },
          title: "Seferi Tamamladım ve ya Sefere Devam Edemiyorum Konum Paylaşımını Durdur",
          description: "Yalnızca seferi tamamladıysanız ve ya sefere devam edemiyorsanız konum paylaşımını durdurun."),
      const Divider(),
      const Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberSixMap('numara6'),
        ),
      )
    ]);
  }

  Future<void> _listenLocation6() async {
      _locationSubscription = location.onLocationChanged.handleError((onError) {
        print(onError);
        _locationSubscription?.cancel();
        setState(() {
          _locationSubscription = null;
        });
      }).listen((loc.LocationData currentlocation) async {
        await FirebaseFirestore.instance.collection('users').doc(deneme).set({//users1 yerine giris yapan kullanicinin kullanici adini alacak
          'numara6KonumLatitude': currentlocation.latitude,
          'numara6KonumLongitude': currentlocation.longitude,
        }, SetOptions(merge: true));
      });
    
  }

  _stopListening6() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
