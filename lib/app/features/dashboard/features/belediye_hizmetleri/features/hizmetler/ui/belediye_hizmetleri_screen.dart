import "package:flutter/material.dart";
import "package:revogarageapp/app/ui/widgets/custom_button.dart";
import "package:revogarageapp/app/ui/widgets/revo_screen_header.dart";

class BelediyeHizmetleriScreen extends StatelessWidget {
  const BelediyeHizmetleriScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RevoScreenHeader(title: "Belediye Hizmetleri"),
          Column(
            children: [
              CustomButton(onPressed: () {}, title: "Evlendirme Hizmetleri", icon: null),
              CustomButton(onPressed: () {}, title: "Su abone işlemleri", icon: null),
              CustomButton(onPressed: () {}, title: "İş Yeri Ruhsatı Alınması", icon: null),
              CustomButton(onPressed: () {}, title: "Cenaze Hizmetleri", icon: null),
              CustomButton(onPressed: () {}, title: "Temizlik Hizmetleri", icon: null),
              CustomButton(onPressed: () {}, title: "Yapı Kullanım Ruhsatı Alınması", icon: null),
              CustomButton(onPressed: () {}, title: "Veteriner İşleri", icon: null),
              CustomButton(onPressed: () {}, title: "ARAMIZDAN AYRILANLAR", icon: null),
            ],
          ),
        ],
      ),
    );
  }
}
