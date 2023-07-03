import 'package:amasyaapp/app/ui/widgets/amasya_home_button.dart';
import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
import 'package:amasyaapp/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OtobusNeredeKullaniciScreen extends StatelessWidget {
  const OtobusNeredeKullaniciScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AmasyaScreenHeader(title: "Kullanıcı"),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const NumberOneLocationRoute());
                    },
                    title: "1 Numara",
                    icon: Icons.directions_bus_filled_outlined),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const NumberTwoLocationRoute());
                    },
                    title: "2 Numara",
                    icon: Icons.directions_bus_filled_outlined),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmasyaHomeButton(
                    onPressed: () {
                      context.router.navigate(const NumberSixLocationRoute());
                    },
                    title: "6 Numara",
                    icon: Icons.directions_bus_filled_outlined),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
