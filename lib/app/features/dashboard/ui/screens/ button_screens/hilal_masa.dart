import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/info_card.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";

class HilalMasaScreen extends StatefulWidget {
  const HilalMasaScreen({super.key});

  @override
  State<HilalMasaScreen> createState() => _HilalMasaScreenState();
}

class _HilalMasaScreenState extends State<HilalMasaScreen> {
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RevoScreenHeader(title: "HİLAL MASA"),
          Column(
            children: [
              Text(
                "+90 505 195 50 05 numaralı\nWhatsapp İhbar\nhattından bizlere\nulaşabilirsiniz.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  InfoCard(onPressed: () {}, title: "İLETİŞİME GEÇ", icon: Icons.touch_app_outlined),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Hilal Masa nasıl çalışır ?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "\n-Belediyeye gelen istek, talep, şikayet ve önerileri ilgili müdürlüklere atar ve takibini yapar.\n\n-Vatandaşı yönlendirme, bilgilendirme ve çözüm üretme konusunda yasal süre içerisinde olumlu ya da olumsuz cevap verilmesi kaydı ile tüm müdürlüklerle koordineli bir çalışma yürütür.\n\n-Müdürlüklerden verilen cevapların vatandaşa dönüşünü hızlı ve güler yüzlü yapılmasını sağlar.\n\n-İlin sorunlarıyla ilgilenerek halkla Belediye arasında köprü görevi görür.\n\n-Halkla İlişkiler ile ilgili yerel ve ulusal düzeydeki uygulamaları takip eder. Halkla İlişkiler faaliyetlerine destek verir.\n\n-İl bazında Hilal Masaya gelen taleplerin istatistik kayıtlarının düzenlenmesini sağlar.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "+90 505 195 50 05 numaralı\nWhatsapp İhbar\nhattından bizlere\nulaşabilirsiniz.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Icon(
                    Icons.arrow_circle_right_rounded,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(25),
                    ),
                    onPressed: () {},
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: const [Text("WHATSAPP"), Icon(Icons.touch_app_outlined)],
                        )),
                  ),
                ],
              ) */
              /* 
              Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    "Hilal Masa\n(+90 505 195 50 05)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "+90 505 195 50 05 numaralı\nWhatsapp İhbar\nhattından bizlere\nulaşabilirsiniz.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                      ),
                    ],
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(25),
                      ),
                      onPressed: () {},
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "WhatsApp",
                              ),
                              const Icon(Icons.dark_mode)
                            ],
                          )),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Hilal Masa Nasıl Çalışır?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "\n-Belediyeye gelen istek, talep, şikayet ve önerileri ilgili müdürlüklere atar ve takibini yapar.\n\n-Vatandaşı yönlendirme, bilgilendirme ve çözüm üretme konusunda yasal süre içerisinde olumlu ya da olumsuz cevap verilmesi kaydı ile tüm müdürlüklerle koordineli bir çalışma yürütür.\n\n-Müdürlüklerden verilen cevapların vatandaşa dönüşünü hızlı ve güler yüzlü yapılmasını sağlar.\n\n-İlin sorunlarıyla ilgilenerek halkla Belediye arasında köprü görevi görür.\n\n-Halkla İlişkiler ile ilgili yerel ve ulusal düzeydeki uygulamaları takip eder. Halkla İlişkiler faaliyetlerine destek verir.\n\n-İl bazında Hilal Masaya gelen taleplerin istatistik kayıtlarının düzenlenmesini sağlar.",
                  textAlign: TextAlign.center,
                ),
              ) */
            ],
          ),
        ],
      ),
    );
  }
}
