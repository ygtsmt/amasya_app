import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "damage_photo_dto.g.dart";

@JsonSerializable()
class DamagePhotoDto extends Equatable {
  const DamagePhotoDto(this.id, this.name, this.base64);
  factory DamagePhotoDto.fromJson(final Map<String, dynamic> json) => _$DamagePhotoDtoFromJson(json);

  final int id;
  final String name;
  final String base64;

  Map<String, dynamic> toJson() => _$DamagePhotoDtoToJson(this);

  @override
  List<Object?> get props => [id, name, base64];
}
