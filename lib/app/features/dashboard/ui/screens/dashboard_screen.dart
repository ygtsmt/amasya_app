import "dart:async";

import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/revo_home_button.dart";
import "package:revogarageapp/core/images.dart";

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  List<String> images = [
    Images.amasyaPageview1,
    Images.amasyaPageview2,
    Images.amasyaPageview3,
    Images.amasyaPageview4,
  ];
  Timer? timer;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(seconds: 5),
          curve: Curves.fastOutSlowIn,
        );
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 260,
            width: double.infinity, // İsteğe bağlı olarak ayarlayabilirsiniz
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "AMASYA \nTarih ve doğanın buluştuğu yer",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              RevoHomeButton(onPressed: () {}, title: "OTOBÜS NEREDE", icon: Icons.directions_bus_filled_outlined),
              RevoHomeButton(onPressed: () {}, title: "BELEDIYE\nBAŞKANIMIZ", icon: Icons.person_outline_outlined),
              RevoHomeButton(onPressed: () {}, title: "title", icon: Icons.abc),
            ],
          ),
          Row(
            children: [
              RevoHomeButton(onPressed: () {}, title: "HABERLER", icon: Icons.newspaper_outlined),
              RevoHomeButton(onPressed: () {}, title: "DUYURULAR", icon: Icons.notifications_active_outlined),
              RevoHomeButton(onPressed: () {}, title: "HAL FIYATLARI", icon: Icons.currency_lira_outlined),
            ],
          ),
          Row(
            children: [
              RevoHomeButton(onPressed: () {}, title: "BELEDIYE\nHIZMETLERI", icon: Icons.text_snippet_outlined),
              RevoHomeButton(onPressed: () {}, title: "BELEDIYE\nPROJELERI", icon: Icons.design_services_outlined),
              RevoHomeButton(onPressed: () {}, title: "title", icon: Icons.abc),
            ],
          ),
        ],
      ),
    );
  }
}
