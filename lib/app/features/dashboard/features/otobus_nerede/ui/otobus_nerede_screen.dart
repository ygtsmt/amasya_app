import 'dart:async';

import 'package:amasyaapp/app/features/auth/features/login/ui/login_form.dart';
import 'package:amasyaapp/app/ui/widgets/amasya_home_button.dart';
import 'package:amasyaapp/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class OtobusNeredeScreen extends StatefulWidget {
  const OtobusNeredeScreen({super.key});
  @override
  _OtobusNeredeScreenState createState() => _OtobusNeredeScreenState();
}

class _OtobusNeredeScreenState extends State<OtobusNeredeScreen> {
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
      const Expanded(child: SizedBox()),
      if (deneme.isEmpty)
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const OtobusNeredeKullaniciScreenRoute());
                    },
                    title: "KULLANICI",
                    icon: Icons.person_outline_outlined)),
          ],
        )),
      if (deneme.length > 1)
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const OtobusNeredeSurucuScreenRoute());
                    },
                    title: "SÜRÜCÜ",
                    icon: Icons.directions_bus_filled_outlined)),
          ],
        )),
      const Expanded(child: SizedBox()),
    ]);
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
