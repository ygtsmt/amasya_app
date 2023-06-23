// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_garage_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGarageRequest _$CreateGarageRequestFromJson(Map<String, dynamic> json) =>
    CreateGarageRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      accountId: json['accountId'] as int,
    );

Map<String, dynamic> _$CreateGarageRequestToJson(
        CreateGarageRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'accountId': instance.accountId,
    };
