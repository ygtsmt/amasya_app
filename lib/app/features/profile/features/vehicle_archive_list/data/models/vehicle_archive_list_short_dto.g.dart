// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_archive_list_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleArchiveShortDto _$VehicleArchiveShortDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleArchiveShortDto(
      id: json['id'] as int,
      vin: json['vin'] as String,
      vehicleBrandName: json['vehicleBrandName'] as String,
      vehicleModelName: json['vehicleModelName'] as String,
      vehicleColorName: json['vehicleColorName'] as String,
      mileage: json['mileage'] as int,
      vehicleTypeId: json['vehicleTypeId'] as int?,
    );

Map<String, dynamic> _$VehicleArchiveShortDtoToJson(
        VehicleArchiveShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vin': instance.vin,
      'vehicleBrandName': instance.vehicleBrandName,
      'vehicleModelName': instance.vehicleModelName,
      'vehicleColorName': instance.vehicleColorName,
      'mileage': instance.mileage,
      'vehicleTypeId': instance.vehicleTypeId,
    };
