import "package:amasyaapp/app/ui/widgets/amasya_screen_header.dart";
import "package:amasyaapp/app/ui/widgets/info_card.dart";
import "package:amasyaapp/core/constants.dart";
import "package:amasyaapp/core/images.dart";
import "package:flutter/material.dart";

class KentBilgisiScreen extends StatefulWidget {
  const KentBilgisiScreen({super.key});

  @override
  State<KentBilgisiScreen> createState() => _KentBilgisiScreenState();
}

class _KentBilgisiScreenState extends State<KentBilgisiScreen> {
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AmasyaScreenHeader(title: "KENT BİLGİSİ"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Images.kralkaya,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            ConstantString().amasyaTarihi,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InfoCard(onPressed: () {}, title: "AMASYA KALESİ", description: ConstantString().amasyaKalesi),
          InfoCard(onPressed: () {}, title: "AYNALI MAĞARA", description: ConstantString().aynaliMagara),
          InfoCard(onPressed: () {}, title: "ALÇAK KÖPRÜ", description: ConstantString().alcakKopri),
          InfoCard(onPressed: () {}, title: "HALİFET GAZİ TÜRBESİ", description: ConstantString().halifetGaziTurbesi),
          InfoCard(onPressed: () {}, title: "BORABAY GÖLÜ", description: ConstantString().borabayGolu),
          InfoCard(
              onPressed: () {}, title: "AMASYA ARKEOLOJİ MÜZESİ", description: ConstantString().amasyaArkeolojiMuzesi),
          InfoCard(
              onPressed: () {}, title: "FERHAT VE ŞİRİN AŞIKLAR MÜZESİ", description: ConstantString().ferhatSirin),
          InfoCard(
            onPressed: () {},
            title: "AMASYA SAAT KULESİ",
            description: ConstantString().amasyaSaatKulesi,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
