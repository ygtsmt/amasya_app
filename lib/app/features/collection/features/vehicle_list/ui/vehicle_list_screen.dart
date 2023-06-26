import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/call_card.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:url_launcher/url_launcher.dart";

class Communication_Screen extends StatefulWidget {
  const Communication_Screen({super.key});

  @override
  State<Communication_Screen> createState() => _Communication_ScreenState();
}

class _Communication_ScreenState extends State<Communication_Screen> {
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RevoScreenHeader(title: "İLETİŞİM"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 7,
              child: ElevatedButton(
                  onPressed: () {
                    Uri maps = Uri.parse(
                        "https://www.google.com/maps/dir//Ellibe%C5%9Fevler,+Mehmet+Varinli+Cd.+No:99,+05200+Amasya+Merkez%2FAmasya/@40.662565,35.8397553,17z/data=!3m1!4b1!4m9!4m8!1m1!4e2!1m5!1m1!1s0x40876e3189b35453:0xd9b568dea72a4e53!2m2!1d35.841944!2d40.662565?entry=ttu");

                    launchUrl(maps);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Amasya Belediye Binası",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Ellibeşevler, Mehmet Varinli Cd. No:99,\n05200 Amasya Merkez/Amasya",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Icon(
                            Icons.map_sharp,
                          ),
                          Text(
                            "Yol Tarifi Al",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          Row(
            children: [
              CallCard(onPressed: () {}, name: "Hizmet Binası", phone: "+90 358 218 80 00"),
              CallCard(onPressed: () {}, name: "Kültür Merkezi", phone: "+90 358 212 01 24"),
            ],
          ),
          Row(
            children: [
              CallCard(onPressed: () {}, name: "Temizlik İşleri", phone: "+90 358 218 80 09"),
              CallCard(
                onPressed: () {},
                name: "Fen İşleri Müdürlüğü",
                phone: "+90 358 280 21 40",
              ),
            ],
          ),
          Row(
            children: [
              CallCard(
                onPressed: () {},
                name: "Park ve Bahçeler\nMüdürlüğü",
                phone: "+90 358 218 72 79",
              ),
              CallCard(
                onPressed: () {},
                name: "İtfaiye Müdürlüğü",
                phone: "+90 358 218 80 06",
              ),
            ],
          ),
          Row(
            children: [
              CallCard(onPressed: () {}, name: "Zabıta", phone: "153"),
              CallCard(onPressed: () {}, name: "Su Arıza", phone: "185"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 14,
              child: ElevatedButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          String facebook = "https://www.facebook.com/amasyabld05/";
                          Uri facebookUri = Uri.parse(facebook);
                          launchUrl(facebookUri, mode: LaunchMode.externalApplication);
                        },
                        child: const Text("Facebook"),
                      ),
                      TextButton(
                        onPressed: () {
                          String instagram = "https://www.instagram.com/amasyabld05/";
                          Uri instagramUri = Uri.parse(instagram);
                          launchUrl(instagramUri, mode: LaunchMode.externalApplication);
                        },
                        child: const Text("Instagram"),
                      ),
                      TextButton(
                        onPressed: () {
                          String twitter = "https://twitter.com/amasyabld05/";
                          Uri twitterUri = Uri.parse(twitter);
                          launchUrl(twitterUri, mode: LaunchMode.externalApplication);
                        },
                        child: const Text("Twitter"),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
