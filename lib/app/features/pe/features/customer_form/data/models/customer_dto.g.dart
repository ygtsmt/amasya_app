// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      acceptSms: json['acceptSms'] as bool,
      acceptEmail: json['acceptEmail'] as bool,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      licenceNumber: json['licenceNumber'] as String?,
      profilePhotoName: json['profilePhotoName'] as String?,
      profilePhotoBase64: json['profilePhotoBase64'] as String?,
    );

Map<String, dynamic> _$CustomerDtoToJson(CustomerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'licenceNumber': instance.licenceNumber,
      'acceptSms': instance.acceptSms,
      'acceptEmail': instance.acceptEmail,
      'profilePhotoName': instance.profilePhotoName,
      'profilePhotoBase64': instance.profilePhotoBase64,
    };
