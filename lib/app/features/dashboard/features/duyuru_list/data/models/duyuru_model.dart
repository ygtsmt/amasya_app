import "package:equatable/equatable.dart";

class DuyuruModelDto extends Equatable {
  const DuyuruModelDto({
    required this.id,
        required this.baslik,
        required this.slug,
        required this.kisaYazi,
        required this.aciklama,
        required this.gorsel,
        this.gun,
        this.ay,
        this.yil,
        required this.tur,
        required this.durum,
        this.yayinlanmaTarihi,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
  });
  

   final int id;
    final String baslik;
    final String slug;
    final String kisaYazi;
    final String aciklama;
    final String gorsel;
    final dynamic gun;
    final dynamic ay;
    final dynamic yil;
    final String tur;
    final String durum;
    final dynamic yayinlanmaTarihi;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic deletedAt;
    
  factory DuyuruModelDto.fromJson(Map<String, dynamic> json) => DuyuruModelDto(
        id: json["id"],
        baslik: json["baslik"],
        slug: json["slug"],
        kisaYazi: json["kisa_yazi"],
        aciklama: json["aciklama"],
        gorsel: json["gorsel"],
        gun: json["gun"],
        ay: json["ay"],
        yil: json["yil"],
        tur: json["tur"],
        durum: json["durum"],
        yayinlanmaTarihi: json["yayinlanma_tarihi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );
  @override
  List<Object?> get props => [
        id,
        baslik,
        slug,
        kisaYazi,
        aciklama,
        gorsel,
        gun,
        ay,
        yil,
        tur,
        durum,
        yayinlanmaTarihi,
        createdAt,
        updatedAt,
        deletedAt
      ];
}
