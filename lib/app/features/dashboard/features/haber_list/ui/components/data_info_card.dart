import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import "package:html/parser.dart" as htmlParser;

class DataInfoCard extends StatelessWidget {
  const DataInfoCard({
    required this.onPressed,
    required this.imagePath,
    this.icerik,
    required this.icon,
    required this.baslik,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String imagePath;
  final String? icerik;
  final String baslik;
  final IconData icon;

  String _removeHtmlTags(String htmlString) {
    var document = htmlParser.parse(htmlString);
    return htmlParser.parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    String plainText = _removeHtmlTags(icerik ?? "");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: 'https://amasya.bel.tr/$imagePath',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              baslik,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          if (icerik != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                plainText,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
          OutlinedButton.icon(
            onPressed: onPressed,
            icon: const Icon(
              Icons.touch_app_outlined,
              color: Colors.white,
            ),
            label: const Text(
              "Detaylı Bilgi",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Divider()
          /* Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(plainText),
          ), */
        ],
      ),
    );
  }
}
