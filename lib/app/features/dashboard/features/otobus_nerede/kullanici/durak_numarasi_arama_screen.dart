import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:amasyaapp/app/ui/widgets/otobus_card.dart';
import 'package:amasyaapp/app/ui/widgets/search_button.dart';
import 'package:amasyaapp/core/core.dart';
import 'package:auto_route/auto_route.dart';
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
  String? isActiveFieldName; // aktiflik kontroludne kullaniyoruz
  int? navigateControl; // hangi otobus numarasi aranmissa o live location sayfasina yonelndirmek icin kullaniyoruz
  List<String> sureler = []; // sureleri buna atiyoruz listviewa falan gostermek icin kullaniyoruz
  final TextEditingController durakNumberController = TextEditingController();
  final TextEditingController otobusNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LatLng? destination; // secilen duragin degerlerini buna atip bakiyoruz
  int? durakNo;
  int? otobusNo;
  String? destinationLatitude;
  String? destinationLongitude;
  List<double> originLatitudes = [];
  List<double> originLongitudes = [];
  double? latitude;
  double? longitude;
  @override
  Widget build(BuildContext context) {
    final wayPointsDurakMap = {
      1: const LatLng(40.649835, 35.795758),
      2: const LatLng(40.650540, 35.797761),
      3: const LatLng(40.651675, 35.800865),
      4: const LatLng(40.652876, 35.803558),
      5: const LatLng(40.651299, 35.805962),
      6: const LatLng(40.646641, 35.810475),
      7: const LatLng(40.643452, 35.808433),
      8: const LatLng(40.637473, 35.808831),
      9: const LatLng(40.616501, 35.813611),
      10: const LatLng(40.602087, 35.809871),
      11: const LatLng(40.606744, 35.812118),
      12: const LatLng(40.603355, 35.818920),
      13: const LatLng(40.607146, 35.812102),
      14: const LatLng(40.617396, 35.814808),
      15: const LatLng(40.633062, 35.813166),
      16: const LatLng(40.646278, 35.810989),
      17: const LatLng(40.650200, 35.807478),
      18: const LatLng(40.652957, 35.803708),
      19: const LatLng(40.652149, 35.801709),
      20: const LatLng(40.650763, 35.798451),
      21: const LatLng(40.659990, 35.840260),
      22: const LatLng(40.655381, 35.836891),
      23: const LatLng(40.650584, 35.830444),
      24: const LatLng(40.648980, 35.816248),
      25: const LatLng(40.632924, 35.812836),
      26: const LatLng(40.635513, 35.810789),
      27: const LatLng(40.643598, 35.809132),
      28: const LatLng(40.649832, 35.819838),
      29: const LatLng(40.657410, 35.838458),
      30: const LatLng(40.654529, 35.824460),
      31: const LatLng(40.655479, 35.817855),
      32: const LatLng(40.656164, 35.814589),
      33: const LatLng(40.656156, 35.805069),
      34: const LatLng(40.657481, 35.797461),
      35: const LatLng(40.659366, 35.796121),
      36: const LatLng(40.657457, 35.796084),
      37: const LatLng(40.657420, 35.800458),
      38: const LatLng(40.655866, 35.805775),
      39: const LatLng(40.655902, 35.816203),
      40: const LatLng(40.655372, 35.833524),
    };
    void getDistanceMatrix(int durakNumarasi, int otobusNo) async {
      int index = durakNumarasi;

      if (otobusNo == 6) {
        if (index >= 1 && index <= 20) {
          destination = wayPointsDurakMap[index];
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
          destination = wayPointsDurakMap[index];
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
          destination = wayPointsDurakMap[index];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yanlış Durak Numarası. Lütfen girdiğiniz durak numarasını kontrol edin.'),
            ),
          );
          return;
        }
      }
      destinationLatitude = destination!.latitude.toString(); //durak seyleri
      destinationLongitude = destination!.longitude.toString(); //durak seyleri

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
                                sureler.clear();
                                originLatitudes.clear();
                                originLongitudes.clear();
                                FocusScope.of(context).unfocus();

                                if (formKey.currentState!.validate()) {
                                  durakNo = int.parse(durakNumberController.text);
                                  otobusNo = int.parse(otobusNumberController.text);
                                  setState(() {
                                    durakNumberController.text = durakNo.toString();
                                    otobusNumberController.text = otobusNo.toString();
                                  });

                                  getDistanceMatrix(durakNo!, otobusNo!);
                                }
                              },
                              title: "ARA",
                              icon: Icons.search_outlined,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.48, // veya istediğiniz bir yükseklik değeri
                              child: ListView.builder(
                                itemCount: sureler.length,
                                itemBuilder: (context, index) {
                                  return OtobusCard(
                                      onTap: () {
                                        navigateControl = int.parse(otobusNumberController.text);

                                        if (navigateControl == 6) {
                                          context.router.navigate(const NumberSixLocationRoute());
                                        } else if (navigateControl == 1) {
                                          context.router.navigate(const NumberOneLocationRoute());
                                        } else if (navigateControl == 2) {
                                          context.router.navigate(const NumberTwoLocationRoute());
                                        } else {
                                          null;
                                        }
                                      },
                                      otobusNo: otobusNumberController.text,
                                      time: sureler[index]);
                                },
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
