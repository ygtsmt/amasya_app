import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class CallCard extends StatelessWidget {
  const CallCard({
    required this.onPressed,
    required this.phone,
    required this.name,
    super.key,
  });

  final VoidCallback onPressed;
  final String phone;
  final String name;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 6,
          child: ElevatedButton(
              onPressed: () async {
                Uri phoneno = Uri.parse('tel:$phone');
                if (await launchUrl(phoneno)) {
                  //dialer opened
                } else {
                  //dailer is not opened
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        phone,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          Text(
                            "İletişime Geç",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Icon(
                            Icons.touch_app_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
