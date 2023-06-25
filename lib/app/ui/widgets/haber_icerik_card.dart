import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import "package:html/parser.dart" as htmlParser;

class HaberIcerikCard extends StatelessWidget {
  const HaberIcerikCard({
    required this.imagePath,
    required this.icerik,
    required this.baslik,
    required this.kisaAciklama,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final String? icerik;
  final String baslik;
  final String kisaAciklama;

  String _removeHtmlTags(String htmlString) {
    var document = htmlParser.parse(htmlString);
    return htmlParser.parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    String plainText = _removeHtmlTags(icerik ?? "");

    return Column(
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Text(
            kisaAciklama,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Text(
            plainText,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider()
        /* Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(plainText),
        ), */
      ],
    );
  }
}
