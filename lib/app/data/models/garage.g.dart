// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Garage _$GarageFromJson(Map<String, dynamic> json) => Garage(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      billingType: json['billingType'] as int,
    );

// ignore: unused_element
Map<String, dynamic> _$GarageToJson(Garage instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'billingType': instance.billingType,
    };
