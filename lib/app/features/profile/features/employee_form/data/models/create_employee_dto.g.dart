// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEmployeeDto _$CreateEmployeeDtoFromJson(Map<String, dynamic> json) =>
    CreateEmployeeDto(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      type: json['type'] as int,
      garageId: json['garageId'] as int,
      inviteCode: json['inviteCode'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CreateEmployeeDtoToJson(CreateEmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'birthDate': instance.birthDate.toIso8601String(),
      'inviteCode': instance.inviteCode,
      'type': instance.type,
      'garageId': instance.garageId,
    };
