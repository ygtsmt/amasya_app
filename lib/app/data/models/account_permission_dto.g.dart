// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_permission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountPermissionDto _$AccountPermissionDtoFromJson(
        Map<String, dynamic> json) =>
    AccountPermissionDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      valueText: json['valueText'] as String?,
      enDate: json['enDate'] == null
          ? null
          : DateTime.parse(json['enDate'] as String),
    );

// ignore: unused_element
Map<String, dynamic> _$AccountPermissionDtoToJson(
        AccountPermissionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'valueText': instance.valueText,
      'enDate': instance.enDate?.toIso8601String(),
    };
