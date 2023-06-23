// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'licence_plate_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicencePlateShortDto _$LicencePlateShortDtoFromJson(
        Map<String, dynamic> json) =>
    LicencePlateShortDto(
      id: json['id'] as int,
      plate: json['plate'] as String,
      garageId: json['garageId'] as int,
    );

Map<String, dynamic> _$LicencePlateShortDtoToJson(
        LicencePlateShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plate': instance.plate,
      'garageId': instance.garageId,
    };
