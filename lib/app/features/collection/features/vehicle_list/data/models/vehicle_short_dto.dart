import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_short_dto.g.dart";

@JsonSerializable()
class VehicleShortDto extends Equatable {
  const VehicleShortDto({
    required this.id,
    required this.vin,
    required this.vehicleBrandName,
    required this.vehicleModelName,
    required this.vehicleColorName,
    required this.mileage,
    required this.vehicleTypeId,
    required this.photoBase64,
    required this.isNew,
  });
  factory VehicleShortDto.fromJson(final Map<String, dynamic> json) => _$VehicleShortDtoFromJson(json);

  final int id;
  final String vin;
  final String vehicleBrandName;
  final String vehicleModelName;
  final String vehicleColorName;
  final int mileage;
  final int? vehicleTypeId;
  final String? photoBase64;
  final bool isNew;

  @override
  List<Object?> get props => [
        id,
        vin,
        vehicleBrandName,
        vehicleModelName,
        vehicleColorName,
        mileage,
        vehicleTypeId,
        photoBase64,
        isNew,
      ];
}
