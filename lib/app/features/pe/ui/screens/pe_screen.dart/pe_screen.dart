import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/info_card.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/images.dart";

class PeScreen extends StatefulWidget {
  const PeScreen({super.key});

  @override
  State<PeScreen> createState() => _PeScreenState();
}

class _PeScreenState extends State<PeScreen> {
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RevoScreenHeader(title: "KENT BİLGİSİ"),

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
            "Yeşilırmak vadisi Harşena Dağı eteklerine kurulan Amasya, 7 bin yılın üzerindeki eski tarihi boyunca bilim adamları, sanatkarlar, şairler yetiştirmiş, Osmanlı şehzadelerinin eğitim gördüğü, Dünyanın en güzel Misket elması, kirazı, şeftalisi ve bamyasının üretildiği, gezip görülecek pek çok tarihi ve doğal güzelliği bulunan ilginç bir şehirdir.\n Milli Mücadelenin temellerinin atıldığı Kurtuluş savaşının ilk önemli adımını teşkil eden Amasya Genelge’sinin 22 Haziran 1919’da okunduğu kent, krallık başkentliği yapmış tarihi ve doğal güzellikleriyle önemli şehirlerimizden biridir.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "AMASYA KALESİ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "AYNALI MAĞARA", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "ALÇAK KÖPRÜ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "HALİFET GAZİ TÜRBESİ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "BORABAY GÖLÜ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "AMASYA ARKEOLOJİ MÜZESİ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),

          Row(
            children: [
              InfoCard(
                  onPressed: () {}, title: "FERHAT VE ŞİRİN AŞIKLAR MÜZESİ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "HARŞENA KALESİ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(onPressed: () {}, title: "KRAL KAYA MEZARLIKLARI", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {}, title: "SABUNCUOĞLU TIP VE CERRAHİ MÜZESİ", icon: Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              InfoCard(
                  onPressed: () {},
                  title: "HAMDULLAH YAZI VE HÜSN-Ü HAT MÜZESİ",
                  icon: Icons.arrow_forward_ios_outlined),
            ],
          ),

          //   RevoHomeButton(onPressed: () {}, title: "title", icon: Icons.abc)
        ],
      ),
    );
  }
}


/* import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/revo_home_button.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";
import "package:revogarageapp/core/images.dart";

class PeScreen extends StatelessWidget {
  const PeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const RevoScreenHeader(title: "KENT BİLGİSİ"),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  "Yeşilırmak vadisi Harşena Dağı eteklerine kurulan Amasya, 7 bin yılın üzerindeki eski tarihi boyunca bilim adamları, sanatkarlar, şairler yetiştirmiş, Osmanlı şehzadelerinin eğitim gördüğü, Dünyanın en güzel Misket elması, kirazı, şeftalisi ve bamyasının üretildiği, gezip görülecek pek çok tarihi ve doğal güzelliği bulunan ilginç bir şehirdir.\n Milli Mücadelenin temellerinin atıldığı Kurtuluş savaşının ilk önemli adımını teşkil eden Amasya Genelge’sinin 22 Haziran 1919’da okunduğu kent, krallık başkentliği yapmış tarihi ve doğal güzellikleriyle önemli şehirlerimizden biridir.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                RevoHomeButton(onPressed: () {}, title: "title", icon: Icons.abc)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
 */