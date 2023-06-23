// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      type: json['type'] as int,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      garageId: json['garageId'] as int?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'garageId': instance.garageId,
      'type': instance.type,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
    };
