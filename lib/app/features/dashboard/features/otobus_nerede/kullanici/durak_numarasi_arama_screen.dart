import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:amasyaapp/app/ui/widgets/otobus_card.dart';
import 'package:amasyaapp/app/ui/widgets/search_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DurakNumarasiAraScreen extends StatefulWidget {
  const DurakNumarasiAraScreen({super.key});

  @override
  State<DurakNumarasiAraScreen> createState() => _DurakNumarasiAraScreenState();
}

class _DurakNumarasiAraScreenState extends State<DurakNumarasiAraScreen> {
  String? isActiveFieldName;

  String? sure;
  List<String> sureler = [];
  final TextEditingController durakNumberController = TextEditingController();
  final TextEditingController otobusNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LatLng? destination;
  @override
  Widget build(BuildContext context) {
    final wayPointsDurakMarkers = <LatLng>[
      //20
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
    final wayPointsDurakMarkersOne = <LatLng>[
      //9
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
    final wayPointsDurakMarkersTwo = <LatLng>[
      //11
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
    final allWayPoints = <LatLng>[];
    allWayPoints.addAll(wayPointsDurakMarkers);
    allWayPoints.addAll(wayPointsDurakMarkersOne);
    allWayPoints.addAll(wayPointsDurakMarkersTwo);
    int? durakNo;
    int? otobusNo;
    void getDistanceMatrix(int durakNumarasi, int otobusNo) async {
      int index = durakNumarasi;

      if (otobusNo == 6) {
        if (index >= 1 && index <= 20) {
          destination = allWayPoints[index - 1];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yanlış Durak Numarası. Lütfen girdiğiniz durak numarasını kontrol edin.'),
            ),
          );
          return;
        }
      } else if (otobusNo == 1) {
        if (index >= 21 && index <= 29) {
          destination = allWayPoints[index - 1];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yanlış Durak Numarası. Lütfen girdiğiniz durak numarasını kontrol edin.'),
            ),
          );
          return;
        }
      } else if (otobusNo == 2) {
        if (index >= 30 && index <= 40) {
          destination = allWayPoints[index - 1];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yanlış Durak Numarası. Lütfen girdiğiniz durak numarasını kontrol edin.'),
            ),
          );
          return;
        }
      }
// duragi aldik mi aldiiiik
      String? destinationLatitude;
      String? destinationLongitude;
      destinationLatitude = destination!.latitude.toString(); //durak seyleri
      destinationLongitude = destination!.longitude.toString(); //durak seyleri

      List<double> originLatitudes = [];
      List<double> originLongitudes = [];
      double? latitude;
      double? longitude;
      QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();

      if (otobusNo == 6) {
        isActiveFieldName = 'isActiveLocationNumara6';
      } else if (otobusNo == 2) {
        isActiveFieldName = 'isActiveLocationNumara2';
      } else if (otobusNo == 1) {
        isActiveFieldName = 'isActiveLocationNumara1';
      }

      for (QueryDocumentSnapshot doc in usersSnapshot.docs) {
        bool isActive = doc[isActiveFieldName!];

        if (isActive) {
          if (otobusNo == 6) {
            latitude = doc['numara6KonumLatitude'];
            longitude = doc['numara6KonumLongitude'];
          } else if (otobusNo == 2) {
            latitude = doc['numara2KonumLatitude'];
            longitude = doc['numara2KonumLongitude'];
          } else if (otobusNo == 1) {
            latitude = doc['numara1KonumLatitude'];
            longitude = doc['numara1KonumLongitude'];
          }

          originLatitudes.add(latitude!);
          originLongitudes.add(longitude!);
        }
      }

      for (int i = 0; i < originLatitudes.length; i++) {
        try {
          double latitude1 = originLatitudes[i];
          double longitude1 = originLongitudes[i];
          Response response = await Dio().get(
              'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude,$destinationLongitude&origins=$latitude1,$longitude1&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM');

          String durationText = response.data['rows'][0]['elements'][0]['duration']['text'];
          if (durationText.contains('mins')) {
            durationText = durationText.replaceAll('mins', 'dakika');
          }
          debugPrint(durationText);
          setState(() {
            sureler.add(durationText);
          });

          print(response);
          debugPrint(originLongitudes.length.toString());
        } catch (e) {
          print(e);
        }
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('guzergahlar').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> guzergahSnapshot) {
              if (!guzergahSnapshot.hasData) {
                return const Center(child: AppleProgressIndicator());
              }

              return StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (
                  context,
                  AsyncSnapshot<QuerySnapshot> userSnapshot,
                ) {
                  if (!userSnapshot.hasData) {
                    return const Center(child: AppleProgressIndicator());
                  }
                  return Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'OTOBÜS NEREDE ?',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Durak Numarası ve Otobüs Numarası Girerek Otobüsün Ne zaman Geleceğini Öğren',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: durakNumberController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                labelText: 'DURAK NUMARASI',
                                prefixIcon: Icon(
                                  Icons.route_outlined,
                                ),
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: 'error'),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: otobusNumberController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                labelText: 'OTOBÜS NUMARASI',
                                prefixIcon: Icon(
                                  Icons.directions_bus_filled_outlined,
                                ),
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: 'error'),
                                ],
                              ),
                            ),
                            SearchButton(
                              onPressed: () {
                                debugPrint(allWayPoints[39].toString());
                                /* FocusScope.of(context).unfocus();

                                if (formKey.currentState!.validate()) {
                                  durakNo = int.parse(durakNumberController.text);
                                  otobusNo = int.parse(otobusNumberController.text);
                                  setState(() {
                                    durakNumberController.text = durakNo.toString();
                                    otobusNumberController.text = otobusNo.toString();
                                  });

                                  sureler.clear();
                                  getDistanceMatrix(durakNo!, otobusNo!);
                                } */
                              },
                              title: "ARA",
                              icon: Icons.search_outlined,
                            ),
                            Container(
                              // color: Colors.red,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.48, // veya istediğiniz bir yükseklik değeri
                                child: ListView.builder(
                                  itemCount: sureler.length,
                                  itemBuilder: (context, index) {
                                    return OtobusCard(
                                        onPressed: () {}, otobusNo: otobusNumberController.text, time: sureler[index]);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
