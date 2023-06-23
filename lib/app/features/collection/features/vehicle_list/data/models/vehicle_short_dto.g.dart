// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleShortDto _$VehicleShortDtoFromJson(Map<String, dynamic> json) =>
    VehicleShortDto(
      id: json['id'] as int,
      vin: json['vin'] as String,
      vehicleBrandName: json['vehicleBrandName'] as String,
      vehicleModelName: json['vehicleModelName'] as String,
      vehicleColorName: json['vehicleColorName'] as String,
      mileage: json['mileage'] as int,
      vehicleTypeId: json['vehicleTypeId'] as int?,
      photoBase64: json['photoBase64'] as String?,
      isNew: json['isNew'] as bool,
    );

Map<String, dynamic> _$VehicleShortDtoToJson(VehicleShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vin': instance.vin,
      'vehicleBrandName': instance.vehicleBrandName,
      'vehicleModelName': instance.vehicleModelName,
      'vehicleColorName': instance.vehicleColorName,
      'mileage': instance.mileage,
      'vehicleTypeId': instance.vehicleTypeId,
      'photoBase64': instance.photoBase64,
      'isNew': instance.isNew,
    };
