import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_photo_dto.g.dart";

@JsonSerializable()
class VehiclePhotoDto extends Equatable {
  const VehiclePhotoDto({
    required this.id,
    required this.name,
    required this.base64,
    this.isDefault = false,
    this.vehicleId,
  });

  factory VehiclePhotoDto.fromJson(final Map<String, dynamic> json) => _$VehiclePhotoDtoFromJson(json);

  final int id;
  final String name;
  final String base64;
  final int? vehicleId;
  final bool isDefault;

  Map<String, dynamic> toJson() => _$VehiclePhotoDtoToJson(this);

  @override
  List<Object?> get props => [id, name, base64, vehicleId, isDefault];
}
