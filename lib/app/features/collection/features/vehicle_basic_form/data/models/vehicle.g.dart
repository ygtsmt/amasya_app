// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['id'] as int,
      vin: json['vin'] as String,
      vehicleBrandName: json['vehicleBrandName'] as String,
      vehicleModelName: json['vehicleModelName'] as String,
      vehicleColorName: json['vehicleColorName'] as String,
      mileage: json['mileage'] as int,
      typeName: json['typeName'] as String,
      vehicleFuelTypeName: json['vehicleFuelTypeName'] as String,
      typeCertification: json['typeCertification'] as String?,
      internalNumber: json['internalNumber'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'vin': instance.vin,
      'vehicleBrandName': instance.vehicleBrandName,
      'vehicleModelName': instance.vehicleModelName,
      'vehicleColorName': instance.vehicleColorName,
      'mileage': instance.mileage,
      'typeName': instance.typeName,
      'vehicleFuelTypeName': instance.vehicleFuelTypeName,
      'typeCertification': instance.typeCertification,
      'internalNumber': instance.internalNumber,
      'notes': instance.notes,
    };
