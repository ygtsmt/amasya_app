import 'dart:convert';

import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:amasyaapp/app/ui/widgets/search_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DurakNumarasiAraScreen extends StatefulWidget {
  const DurakNumarasiAraScreen({super.key});

  @override
  State<DurakNumarasiAraScreen> createState() => _DurakNumarasiAraScreenState();
}

class _DurakNumarasiAraScreenState extends State<DurakNumarasiAraScreen> {
  String distanceText = '';
  String durationText = '';

  Future<dynamic> getDistance(
    String origin,
    String destination,
  ) async {
    String url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destination|40.619432,35.818170&origins=$origin&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        var elements = responseBody['rows'][0]['elements'][0];
        var distance = elements['distance']['text'];
        var duration = elements['duration']['text'];
        debugPrint(response.body);
        setState(() {
          distanceText = distance;
          durationText = duration;
        });
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController durakNumberController = TextEditingController(text: "300");
    final TextEditingController otobusNumberController = TextEditingController(text: "6");
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                          SearchButton(
                              onPressed: () {
                                getDistance(
                                    "${userSnapshot.data!.docs.singleWhere((element) => element.id == "users1")['numara6KonumLatitude']}, ${userSnapshot.data!.docs.singleWhere((element) => element.id == "users1")['numara6KonumLongitude']}",
                                    "${guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")['latitudeStart']}, ${guzergahSnapshot.data!.docs.singleWhere((element) => element.id == "numara6")['longitudeStart']}");
                              },
                              title: "ARA",
                              icon: Icons.search_outlined),
                        ],
                      ),
                    ),
                    Text('Mesafe: $distanceText'),
                    Text('Süre: $durationText'),
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










/* 
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
                          ), */