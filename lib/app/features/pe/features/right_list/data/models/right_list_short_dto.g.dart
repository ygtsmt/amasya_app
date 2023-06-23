// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'right_list_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RightListShortDto _$RightListShortDtoFromJson(Map<String, dynamic> json) =>
    RightListShortDto(
      id: json['id'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      garageId: json['garageId'] as int,
    );

Map<String, dynamic> _$RightListShortDtoToJson(RightListShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'garageId': instance.garageId,
    };
