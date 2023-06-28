import "package:equatable/equatable.dart";

class HalFiyatlariModelDto extends Equatable {
  const HalFiyatlariModelDto({
    required this.id,
        required this.baslik,
        required this.slug,
        required this.dosya,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
  });
  

  final int id;
    final String baslik;
    final String slug;
    final String dosya;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic deletedAt;
    
   factory HalFiyatlariModelDto.fromJson(Map<String, dynamic> json) => HalFiyatlariModelDto(
        id: json["id"],
        baslik: json["baslik"],
        slug: json["slug"],
        dosya: json["dosya"],
       
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    ); 
  @override
  List<Object?> get props => [
        id,
        baslik,
        slug,
      dosya,
        createdAt,
        updatedAt,
        deletedAt
      ];
}
