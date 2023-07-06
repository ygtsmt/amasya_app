import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import 'package:amasyaapp/app/ui/widgets/search_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class DurakNumarasiAraScreen extends StatefulWidget {
  const DurakNumarasiAraScreen({super.key});

  @override
  State<DurakNumarasiAraScreen> createState() => _DurakNumarasiAraScreenState();
}

class _DurakNumarasiAraScreenState extends State<DurakNumarasiAraScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController durakNumberController = TextEditingController(text: "300");
    final TextEditingController otobusNumberController = TextEditingController(text: "6");
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    void getDistanceMatrix(String destination, String origin) async {
      try {
        var response = await Dio().get(
            'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destination&origins=$origin&key=AIzaSyAWhVmUEq7HXJO38JUiShDafdXwPIbWyfM');
        print(response);
        debugPrint("response");
      } catch (e) {
        print(e);
      }
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
                    getDistanceMatrix("40.618244, 35.815631", "40.651208, 35.832546");
                  },
                  title: "ARA",
                  icon: Icons.search_outlined),
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
                      return const Text("streambuidlerrrr");
                    },
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
