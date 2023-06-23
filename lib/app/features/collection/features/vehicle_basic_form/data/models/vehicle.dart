import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle.g.dart";

@JsonSerializable()
class Vehicle extends Equatable {
  const Vehicle({
    required this.id,
    required this.vin,
    required this.vehicleBrandName,
    required this.vehicleModelName,
    required this.vehicleColorName,
    required this.mileage,
    required this.typeName,
    required this.vehicleFuelTypeName,
    this.typeCertification,
    this.internalNumber,
    this.notes,
  });
  factory Vehicle.fromJson(final Map<String, dynamic> json) => _$VehicleFromJson(json);

  final int id;
  final String vin;
  final String vehicleBrandName;
  final String vehicleModelName;
  final String vehicleColorName;
  final int mileage;
  final String typeName;
  final String vehicleFuelTypeName;
  final String? typeCertification;
  final String? internalNumber;
  final String? notes;

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  @override
  List<Object?> get props => [
        id,
        vin,
        vehicleBrandName,
        vehicleModelName,
        vehicleColorName,
        mileage,
        typeName,
        vehicleFuelTypeName,
        typeCertification,
        internalNumber,
        notes
      ];
}
