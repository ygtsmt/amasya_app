import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/info_card.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";

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
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "Hizmet Binası    +90 358 218 80 00", icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {}, title: "Kültür Merkezi    +90 358 212 01 24", icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {}, title: "Temizlik İşleri     +90 358 218 80 09", icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {},
                  title: "Fen İşleri Müdürlüğü     +90 358 280 21 40",
                  icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {},
                  title: "Park ve Bahçeler Müdürlüğü +90 358 218 72 79",
                  icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {}, title: "İtfaiye Müdürlüğü     +90 358 218 80 06", icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "Zabıta     153", icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "Su Arıza     185", icon: Icons.add_ic_call_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "Faks Numarası     +90 358 218 32 86", icon: Icons.fax_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "E-Posta Adresi    amasya@amasya.bel.tr", icon: Icons.email_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {},
                  title: "ADRES : Ellibeşevler, Mehmet Varinli Cd. \n No:99,05200 Amasya Merkez/Amasya",
                  icon: Icons.location_on_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
