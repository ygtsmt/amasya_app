// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuctionCreateDto _$AuctionCreateDtoFromJson(Map<String, dynamic> json) =>
    AuctionCreateDto(
      vehicleId: json['vehicleId'] as int,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      startPrice: (json['startPrice'] as num).toDouble(),
      sellerId: json['sellerId'] as int,
      status: json['status'] as int,
    );

Map<String, dynamic> _$AuctionCreateDtoToJson(AuctionCreateDto instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'startPrice': instance.startPrice,
      'sellerId': instance.sellerId,
      'status': instance.status,
    };
