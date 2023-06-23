// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_tire_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleTireDetailDto _$VehicleTireDetailDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleTireDetailDto(
      id: json['id'] as int? ?? 0,
      vehicleTireType: json['vehicleTireType'] as int?,
      frontTireBrandId: json['frontTireBrandId'] as int?,
      frontTireRimId: json['frontTireRimId'] as int?,
      frontDimention: json['frontDimention'] as String?,
      frontRimProfile: json['frontRimProfile'] as String?,
      rearTireBrandId: json['rearTireBrandId'] as int?,
      rearTireRimId: json['rearTireRimId'] as int?,
      rearDimention: json['rearDimention'] as String?,
      rearRimProfile: json['rearRimProfile'] as String?,
    );

Map<String, dynamic> _$VehicleTireDetailDtoToJson(
        VehicleTireDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleTireType': instance.vehicleTireType,
      'frontTireBrandId': instance.frontTireBrandId,
      'frontTireRimId': instance.frontTireRimId,
      'frontDimention': instance.frontDimention,
      'frontRimProfile': instance.frontRimProfile,
      'rearTireBrandId': instance.rearTireBrandId,
      'rearTireRimId': instance.rearTireRimId,
      'rearDimention': instance.rearDimention,
      'rearRimProfile': instance.rearRimProfile,
    };
