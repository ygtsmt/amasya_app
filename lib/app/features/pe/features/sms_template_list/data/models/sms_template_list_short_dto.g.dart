// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_template_list_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsTemplateListShortDto _$SmsTemplateListShortDtoFromJson(
        Map<String, dynamic> json) =>
    SmsTemplateListShortDto(
      id: json['id'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      garageId: json['garageId'] as int,
    );

Map<String, dynamic> _$SmsTemplateListShortDtoToJson(
        SmsTemplateListShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'garageId': instance.garageId,
    };
