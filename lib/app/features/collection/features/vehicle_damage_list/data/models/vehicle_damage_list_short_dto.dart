import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";
import "package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/models/damage_photo_dto.dart";

part "vehicle_damage_list_short_dto.g.dart";

@JsonSerializable()
class VehicleDamageListShortDto extends Equatable {
  const VehicleDamageListShortDto({
    required this.id,
    required this.vehicleId,
    required this.name,
    required this.description,
    required this.price,
    this.photos,
  });
  factory VehicleDamageListShortDto.fromJson(final Map<String, dynamic> json) =>
      _$VehicleDamageListShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDamageListShortDtoToJson(this);

  final int id;
  final int vehicleId;
  final String name;
  final String? description;
  final double price;
  final List<DamagePhotoDto>? photos;

  @override
  List<Object?> get props => [id, vehicleId, name, description, price, photos];
}
