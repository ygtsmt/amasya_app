import "package:amasyaapp/app/ui/widgets/amasya_screen_header.dart";
import "package:amasyaapp/app/ui/widgets/search_button.dart";
import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";

class ElmaKartScreen extends StatefulWidget {
  const ElmaKartScreen({super.key});

  @override
  State<ElmaKartScreen> createState() => _ElmaKartScreenState();
}

class _ElmaKartScreenState extends State<ElmaKartScreen> {
  String cardNumber = '';

  Widget _buildCreditCard(String cardNumber) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: const DecorationImage(
            image: AssetImage('assets/images/amasyaPageview4.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    cardNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'CourrierPrime',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "ELMAKART",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'CourrierPrime',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AmasyaScreenHeader(title: "Elma Kart"),
          Column(
            children: [
              Column(
                children: [
                  _buildCreditCard(cardNumber),
                  TextFormField(
                    //      controller: _userIdController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'KART NUMARASINI GİRİNİZ',
                      prefixIcon: Icon(
                        Icons.numbers_outlined,
                      ),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'error'),
                      ],
                    ),
                    onChanged: (value) {
                      setState(() {
                        cardNumber = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SearchButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                    title: "SORGULA",
                    icon: Icons.search_outlined,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
