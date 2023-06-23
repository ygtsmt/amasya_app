// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCreateRequest _$VehicleCreateRequestFromJson(
        Map<String, dynamic> json) =>
    VehicleCreateRequest(
      vehicleModelId: json['vehicleModelId'] as int,
      vehicleColorId: json['vehicleColorId'] as int,
      mileage: json['mileage'] as int?,
      typeCertification: json['typeCertification'] as String?,
      notes: json['notes'] as String?,
      marketDate: json['marketDate'] == null
          ? null
          : DateTime.parse(json['marketDate'] as String),
      internalNumber: json['internalNumber'] as String?,
      vehicleFuelTypeId: json['vehicleFuelTypeId'] as int?,
      vin: json['vin'] as String,
      isNew: json['isNew'] as bool,
    );

Map<String, dynamic> _$VehicleCreateRequestToJson(
        VehicleCreateRequest instance) =>
    <String, dynamic>{
      'isNew': instance.isNew,
      'vin': instance.vin,
      'vehicleModelId': instance.vehicleModelId,
      'vehicleColorId': instance.vehicleColorId,
      'mileage': instance.mileage,
      'typeCertification': instance.typeCertification,
      'notes': instance.notes,
      'marketDate': instance.marketDate?.toIso8601String(),
      'internalNumber': instance.internalNumber,
      'vehicleFuelTypeId': instance.vehicleFuelTypeId,
    };
