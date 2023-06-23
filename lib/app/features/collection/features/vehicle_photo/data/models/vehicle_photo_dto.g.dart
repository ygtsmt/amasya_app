// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclePhotoDto _$VehiclePhotoDtoFromJson(Map<String, dynamic> json) =>
    VehiclePhotoDto(
      id: json['id'] as int,
      name: json['name'] as String,
      base64: json['base64'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
      vehicleId: json['vehicleId'] as int?,
    );

Map<String, dynamic> _$VehiclePhotoDtoToJson(VehiclePhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base64': instance.base64,
      'vehicleId': instance.vehicleId,
      'isDefault': instance.isDefault,
    };
