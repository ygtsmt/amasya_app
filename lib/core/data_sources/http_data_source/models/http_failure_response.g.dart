// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_failure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpFailureResponse _$HttpFailureResponseFromJson(Map<String, dynamic> json) =>
    HttpFailureResponse(
      status: json['status'] as int,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, (e as List<dynamic>?)?.map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$HttpFailureResponseToJson(
        HttpFailureResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errors': instance.errors,
    };
