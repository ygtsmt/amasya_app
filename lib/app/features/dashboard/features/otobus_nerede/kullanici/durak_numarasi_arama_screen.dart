import 'dart:convert';

import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:amasyaapp/app/ui/widgets/search_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

class DurakNumarasiAraScreen extends StatefulWidget {
  const DurakNumarasiAraScreen({super.key});

  @override
  State<DurakNumarasiAraScreen> createState() => _DurakNumarasiAraScreenState();
}

class _DurakNumarasiAraScreenState extends State<DurakNumarasiAraScreen> {
  //String distanceText = '';
  String arrivalTimeBus1 = '';
  String arrivalTimeBus2 = '';
  String arrivalTimeBus3 = '';

  @override
  Widget build(BuildContext context) {
    Map<String, String> arrivalTimes = {};

    final TextEditingController durakNumberController = TextEditingController(text: "300");
    final TextEditingController otobusNumberController = TextEditingController(text: "6");
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Future<dynamic> getDistance(
        String originLatitude, String originLongitude, String destinationLatitude, String destinationLongitude) async {
      String origin = "$originLatitude, $originLongitude";
      String destination = "$destinationLatitude, $destinationLongitude";

      String url =
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destination&origins=$origin&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM';

      try {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          var elements = responseBody['rows'][0]['elements'][0];
          //  var distance = elements['distance']['text'];
          var duration = elements['duration']['text'];
          setState(() {
            // distanceText = distance;
            if (otobusNumberController.text == "6") {
              if (arrivalTimeBus1.isEmpty) {
                arrivalTimeBus1 = duration;
              } else if (arrivalTimeBus2.isEmpty) {
                arrivalTimeBus2 = duration;
              } else if (arrivalTimeBus3.isEmpty) {
                arrivalTimeBus3 = duration;
              }
              arrivalTimes[otobusNumberController.text] = duration;
            }
            if (otobusNumberController.text == "1") {
              if (arrivalTimeBus1.isEmpty) {
                arrivalTimeBus1 = duration;
              } else if (arrivalTimeBus2.isEmpty) {
                arrivalTimeBus2 = duration;
              } else if (arrivalTimeBus3.isEmpty) {
                arrivalTimeBus3 = duration;
              }
              arrivalTimes[otobusNumberController.text] = duration;
            }
            if (otobusNumberController.text == "2") {
              if (arrivalTimeBus1.isEmpty) {
                arrivalTimeBus1 = duration;
              } else if (arrivalTimeBus2.isEmpty) {
                arrivalTimeBus2 = duration;
              } else if (arrivalTimeBus3.isEmpty) {
                arrivalTimeBus3 = duration;
              }
              arrivalTimes[otobusNumberController.text] = duration;
            }
          });
        } else {
          return null;
        }
      } catch (e) {
        print(e);
        return null;
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
              builder: (context, AsyncSnapshot<QuerySnapshot> userSnapshot) {
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
                              String durakNumber = durakNumberController.text;
                              String otobusNumber = otobusNumberController.text;
                              String konumLatitudeFieldName = 'numara$otobusNumber' 'KonumLatitude';
                              String konumLongitudeFieldName = 'numara$otobusNumber' 'KonumLongitude';
                              List originLatitudes =
                                  userSnapshot.data!.docs.map((element) => element[konumLatitudeFieldName]).toList();
                              List originLongitudes =
                                  userSnapshot.data!.docs.map((element) => element[konumLongitudeFieldName]).toList();

                              String guzergahDocumentId = "numara$otobusNumber";

                              double destinationLatitude = guzergahSnapshot.data!.docs
                                  .singleWhere((element) => element.id == guzergahDocumentId)['latitudeStart'];
                              double destinationLongitude = guzergahSnapshot.data!.docs
                                  .singleWhere((element) => element.id == guzergahDocumentId)['longitudeStart'];

                              for (int i = 0; i < originLatitudes.length; i++) {
                                double originLatitude = originLatitudes[i];
                                double originLongitude = originLongitudes[i];
                                getDistance(originLatitude.toString(), originLongitude.toString(),
                                    destinationLatitude.toString(), destinationLongitude.toString());
                              }
                            },
                            title: "ARA",
                            icon: Icons.search_outlined,
                          ),
                          Text('Varış Süresi Otobüs 1: $arrivalTimeBus1'),
                          Text('Varış Süresi Otobüs 2: $arrivalTimeBus2'),
                          Text('Varış Süresi Otobüs 3: $arrivalTimeBus3'),
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
