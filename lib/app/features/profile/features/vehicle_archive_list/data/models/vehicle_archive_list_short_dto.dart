import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_archive_list_short_dto.g.dart";

@JsonSerializable()
class VehicleArchiveShortDto extends Equatable {
  const VehicleArchiveShortDto({
    required this.id,
    required this.vin,
    required this.vehicleBrandName,
    required this.vehicleModelName,
    required this.vehicleColorName,
    required this.mileage,
    required this.vehicleTypeId,
  });
  factory VehicleArchiveShortDto.fromJson(final Map<String, dynamic> json) => _$VehicleArchiveShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArchiveShortDtoToJson(this);
  final int id;
  final String vin;
  final String vehicleBrandName;
  final String vehicleModelName;
  final String vehicleColorName;
  final int mileage;
  final int? vehicleTypeId;

  @override
  List<Object?> get props => [
        id,
        vin,
        vehicleBrandName,
        vehicleModelName,
        vehicleColorName,
        mileage,
        vehicleTypeId,
      ];
}
