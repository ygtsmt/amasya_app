// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAuth _$AccountAuthFromJson(Map<String, dynamic> json) => AccountAuth(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AccountAuthToJson(AccountAuth instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
