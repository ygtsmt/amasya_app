import "package:json_annotation/json_annotation.dart";

part "vehicle_create_request.g.dart";

@JsonSerializable()
class VehicleCreateRequest {
  const VehicleCreateRequest({
    required this.vehicleModelId,
    required this.vehicleColorId,
    required this.mileage,
    required this.typeCertification,
    required this.notes,
    required this.marketDate,
    required this.internalNumber,
    required this.vehicleFuelTypeId,
    required this.vin,
    required this.isNew,
  });
  final bool isNew;
  final String vin;
  final int vehicleModelId;
  final int vehicleColorId;
  final int? mileage;
  final String? typeCertification;
  final String? notes;
  final DateTime? marketDate;
  final String? internalNumber;
  final int? vehicleFuelTypeId;

  Map<String, dynamic> toJson() => _$VehicleCreateRequestToJson(this);
}
