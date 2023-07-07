import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
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
  @override
  Widget build(BuildContext context) {
    final TextEditingController durakNumberController = TextEditingController();
    final TextEditingController otobusNumberController = TextEditingController(text: "6");
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    int durakNo;
    void getDistanceMatrix(int durakNumarasi) async {
      int index = durakNumarasi - 1;
      LatLng destination = wayPointsDurakMarkers[index];
      String? destinationLatitude;
      String? destinationLongitude;
      destinationLatitude = destination.latitude.toString();
      destinationLongitude = destination.longitude.toString();
      QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('users').get();

      List<double> originLatitudes = [];
      List<double> originLongitudes = [];

      for (QueryDocumentSnapshot doc in usersSnapshot.docs) {
        double latitude = doc['numara6KonumLatitude'];
        double longitude = doc['numara6KonumLongitude'];

        originLatitudes.add(latitude);
        originLongitudes.add(longitude);
      }
      for (int i = 0; i < originLatitudes.length; i++) {
        try {
          double latitude1 = originLatitudes[i];
          double longitude1 = originLongitudes[i];
          var response = await Dio().get(
              'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude,$destinationLongitude&origins=$latitude1,$longitude1&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM'
              );
          print(response);
          debugPrint(originLongitudes.length.toString());
        } catch (e) {
          print(e);
        }
      }
    }

    return Column(
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
                              durakNo = int.parse(durakNumberController.text);
                              getDistanceMatrix(durakNo);
                            },
                            title: "ARA",
                            icon: Icons.search_outlined,
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
    );
  }
}
