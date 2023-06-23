// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damage_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DamagePhotoDto _$DamagePhotoDtoFromJson(Map<String, dynamic> json) =>
    DamagePhotoDto(
      json['id'] as int,
      json['name'] as String,
      json['base64'] as String,
    );

Map<String, dynamic> _$DamagePhotoDtoToJson(DamagePhotoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base64': instance.base64,
    };
