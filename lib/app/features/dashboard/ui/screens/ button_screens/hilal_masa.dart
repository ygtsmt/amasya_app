import 'package:amasyaapp/app/ui/widgets/amasya_screen_header.dart';
import "package:amasyaapp/app/ui/widgets/custom_button.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class HilalMasaScreen extends StatefulWidget {
  const HilalMasaScreen({super.key});

  @override
  State<HilalMasaScreen> createState() => _HilalMasaScreenState();
}

class _HilalMasaScreenState extends State<HilalMasaScreen> {
  // ignore: unused_field
  Future<void>? _launched;
  // ignore: unused_field
  bool _hasCallSupport = false;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  final Uri toLaunch = Uri(scheme: 'https', host: 'wa.me', path: "5051955005");
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AmasyaScreenHeader(title: "HİLAL MASA"),
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
              CustomButton(
                  onPressed: () {
                    _launched = _launchInBrowser(toLaunch);
                  },
                  title: "İLETİŞİME GEÇ",
                  icon: null),
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
            ],
          ),
        ],
      ),
    );
  }
}
