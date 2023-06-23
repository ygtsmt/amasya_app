// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_cost_list_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCostListShortDto _$VehicleCostListShortDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleCostListShortDto(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      vehicleId: json['vehicleId'] as int?,
    );

Map<String, dynamic> _$VehicleCostListShortDtoToJson(
        VehicleCostListShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'name': instance.name,
      'price': instance.price,
    };
