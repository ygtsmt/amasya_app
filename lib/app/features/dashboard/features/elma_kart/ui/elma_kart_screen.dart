import "package:amasyaapp/app/ui/widgets/amasya_screen_header.dart";
import "package:amasyaapp/core/core.dart";
import "package:flutter/material.dart";

class ElmaKartScreen extends StatefulWidget {
  const ElmaKartScreen({super.key});

  @override
  State<ElmaKartScreen> createState() => _ElmaKartScreenState();
}

class _ElmaKartScreenState extends State<ElmaKartScreen> {
  String cardNumber = '';

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AmasyaScreenHeader(
            title: "DR. BAYRAM ÇELİK",
          ),
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        Images.bayramCelik,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ConstantString().ozgecmis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
