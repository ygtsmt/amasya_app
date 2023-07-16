import 'package:amasyaapp/app/ui/widgets/apple_progress_indicator.dart';
import "package:flutter/material.dart";
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class BelediyeProjeleriScreen extends StatefulWidget {
  const BelediyeProjeleriScreen({super.key});

  @override
  State<BelediyeProjeleriScreen> createState() => _BelediyeProjeleriScreenState();
}

class _BelediyeProjeleriScreenState extends State<BelediyeProjeleriScreen> {
  @override
  Widget build(final BuildContext context) {
    return const PDF(
      enableSwipe: true,
      
      // nightMode: true,
      swipeHorizontal: true,
    ).cachedFromUrl(
      "https://amasya.bel.tr/uploads/projelerimiz/proje.pdf",
      placeholder: (progress) => const Center(child: AppleProgressIndicator()),
    );
  }
}
