import 'dart:async';

import 'package:amasyaapp/app/ui/widgets/amasya_home_button.dart';
import 'package:amasyaapp/core/images.dart';
import 'package:amasyaapp/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Amasya App",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  width: double.infinity,
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
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Color.fromARGB(255, 147, 5, 5),
                                      content: Text(
                                        'Çok Yakında Hizmetinizde!',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                  /* if (deneme.length > 2) {
                                    context.router.navigate(const OtobusNeredeSurucuScreenRoute());
                                  }
                                  if (deneme.length < 2) {
                                    context.router.navigate(const OtobusNeredeKullaniciScreenRoute());
                                  } */
                                },
                                title: 'OTOBÜS\nNEREDE',
                                icon: Icons.directions_bus_filled_outlined,
                              ),
                            ),
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const ElmaKartScreenRoute());
                                },
                                title: 'BELEDİYE\nBAŞKANIMIZ',
                                icon: Icons.person_outline_outlined,
                              ),
                            ),
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const HilalMasaScreenRoute());
                                },
                                title: 'HİLAL\nMASA',
                                icon: Icons.message_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const HaberListScreenRoute());
                                },
                                title: 'HABERLER',
                                icon: Icons.newspaper_outlined,
                              ),
                            ),
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const DuyuruListScreenRoute());
                                },
                                title: 'DUYURULAR',
                                icon: Icons.notifications_active_outlined,
                              ),
                            ),
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const HalFiyatlariListScreenRoute());
                                },
                                title: 'HAL\nFİYATLARI',
                                icon: Icons.currency_lira_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const BelediyeHizmetleriScreenRoute());
                                },
                                title: 'BELEDİYE\nHİZMETLERİ',
                                icon: Icons.text_snippet_outlined,
                              ),
                            ),
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const BelediyeProjeleriScreenRoute());
                                },
                                title: 'BELEDİYE\nPROJELERİ',
                                icon: Icons.design_services_outlined,
                              ),
                            ),
                            Expanded(
                              child: AmasyaHomeButton(
                                onPressed: () {
                                  context.router.navigate(const NobetciEczaneScreenRoute());
                                },
                                title: 'NÖBETÇİ\nECZANELER',
                                icon: Icons.e_mobiledata_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
