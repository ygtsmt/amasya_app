import 'dart:async';

import 'package:amasyaapp/app/features/dashboard/features/otobus_nerede/ui/mymap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  _getLocation1();
                },
                child: const Text('add my location user1')),
            OutlinedButton(
                onPressed: () {
                  _listenLocation1();
                },
                child: const Text('enable live location user1')),
          ],
        ),
        OutlinedButton(
            onPressed: () {
              _stopListening1();
            },
            child: const Text('stop live location user1')),
        Column(children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    _getLocation2();
                  },
                  child: const Text('add my location user2')),
              OutlinedButton(
                  onPressed: () {
                    _listenLocation2();
                  },
                  child: const Text('enable live location user2')),
            ],
          ),
          OutlinedButton(
              onPressed: () {
                _stopListening2();
              },
              child: const Text('stop live location user2')),
          const Divider()
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  _getLocation3();
                },
                child: const Text('add my location user3')),
            OutlinedButton(
                onPressed: () {
                  _listenLocation3();
                },
                child: const Text('enable live location user3')),
          ],
        ),
        OutlinedButton(
            onPressed: () {
              _stopListening3();
            },
            child: const Text('stop live location user3')),
        const Divider(),
        Expanded(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('location').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("user ${index + 1}"),
                    subtitle: Row(
                      children: [
                        Text(snapshot.data!.docs[index]['latitude'].toString()),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(snapshot.data!.docs[index]['longitude'].toString()),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.directions),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => MyMap(snapshot.data!.docs[index].id , "user2")));
                      },
                    ),
                  );
                });
          },
        )),
      ],
    );
  }


  _getLocation1() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation1() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }

  _stopListening1() {
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
  _getLocation2() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user2').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation2() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user2').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }

  _stopListening2() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }


  _getLocation3() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user3').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation3() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user3').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }

  _stopListening3() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }
}
