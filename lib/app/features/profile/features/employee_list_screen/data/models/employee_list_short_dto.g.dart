// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeListShortDto _$EmployeeListShortDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeListShortDto(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      refreshTokenEndDate: json['refreshTokenEndDate'] == null
          ? null
          : DateTime.parse(json['refreshTokenEndDate'] as String),
      type: json['type'] as int,
      garageId: json['garageId'] as int,
      passwordChangeOn: json['passwordChangeOn'] == null
          ? null
          : DateTime.parse(json['passwordChangeOn'] as String),
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$EmployeeListShortDtoToJson(
        EmployeeListShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'refreshTokenEndDate': instance.refreshTokenEndDate?.toIso8601String(),
      'type': instance.type,
      'garageId': instance.garageId,
      'passwordChangeOn': instance.passwordChangeOn?.toIso8601String(),
      'fullName': instance.fullName,
    };
