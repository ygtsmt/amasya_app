import 'dart:async';

import 'package:amasyaapp/app/features/auth/features/login/ui/login_form.dart';
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
      if (_locationSubscription != null)
        Expanded(
            child: Container(
                color: Colors.red.shade900,
                child: Center(
                  child: Text(
                    "2 NUMARALI OTOBÜS OLARAK KONUMUNUZ PAYLAŞILIYOR\n(Yolculuk bittiğinde kapatınız.)",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                )))
    ]);
  }

  Future<void> _listenLocation2() async {
    _locationSubscription?.cancel();
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      debugPrint(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('users').doc(deneme).set({
        //users1 yerine giris yapan kullanicinin kullanici adini alacak
        'numara2KonumLatitude': currentlocation.latitude,
        'numara2KonumLongitude': currentlocation.longitude,
        'isActiveLocationNumara2': true
      }, SetOptions(merge: true));
    });
  }

  _stopListening2() async {
    await FirebaseFirestore.instance.collection('users').doc(deneme).set({
      'isActiveLocationNumara2': false,
    }, SetOptions(merge: true));
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
