// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_damage_list_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDamageListShortDto _$VehicleDamageListShortDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleDamageListShortDto(
      id: json['id'] as int,
      vehicleId: json['vehicleId'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => DamagePhotoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleDamageListShortDtoToJson(
        VehicleDamageListShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'photos': instance.photos,
    };
