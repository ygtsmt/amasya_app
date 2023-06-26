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
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        phone,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Icon(
                        Icons.phone_forwarded_outlined,
                      ),
                      const Text("İletişime Geç"),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
