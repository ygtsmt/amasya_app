import "dart:async";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import 'package:amasyaapp/app/ui/widgets/amasya_home_button.dart';
import "package:amasyaapp/core/images.dart";
import "package:amasyaapp/core/routes/app_router.dart";

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
              AmasyaHomeButton(onPressed: () {}, title: "OTOBÜS NEREDE", icon: Icons.directions_bus_filled_outlined),
              AmasyaHomeButton(onPressed: () {}, title: "ELMAKART", icon: Icons.credit_card_outlined),
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const HilalMasaScreenRoute());
                  },
                  title: "HİLAL MASA",
                  icon: Icons.message_outlined),
            ],
          ),
          Row(
            children: [
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const HaberListScreenRoute());
                  },
                  title: "HABERLER",
                  icon: Icons.newspaper_outlined),
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const DuyuruListScreenRoute());
                  },
                  title: "DUYURULAR",
                  icon: Icons.notifications_active_outlined),
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const HalFiyatlariListScreenRoute());
                  },
                  title: "HAL FİYATLARI",
                  icon: Icons.currency_lira_outlined),
            ],
          ),
          Row(
            children: [
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const BelediyeHizmetleriScreenRoute());
                  },
                  title: "BELEDİYE\nHİZMETLERİ",
                  icon: Icons.text_snippet_outlined),
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const BelediyeProjeleriScreenRoute());
                  },
                  title: "BELEDİYE\nPROJELERİ",
                  icon: Icons.design_services_outlined),
              AmasyaHomeButton(
                  onPressed: () {
                    context.router.navigate(const NobetciEczaneScreenRoute());
                  },
                  title: "NÖBETÇİ\nECZANELER",
                  icon: Icons.e_mobiledata_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
