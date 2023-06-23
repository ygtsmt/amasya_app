// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuctionShortDto _$AuctionShortDtoFromJson(Map<String, dynamic> json) =>
    AuctionShortDto(
      id: json['id'] as int,
      vehicleId: json['vehicleId'] as int,
      vehicleVin: json['vehicleVin'] as String,
      vehicleModel: json['vehicleModel'] as String,
      vehicleBrand: json['vehicleBrand'] as String,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      startPrice: (json['startPrice'] as num).toDouble(),
      sellerId: json['sellerId'] as int,
      sellerName: json['sellerName'] as String,
      buyerId: json['buyerId'] as int,
      buyerName: json['buyerName'] as String,
      buyerFee: (json['buyerFee'] as num).toDouble(),
      sellerFee: (json['sellerFee'] as num).toDouble(),
      status: json['status'] as int,
      statusText: json['statusText'] as String,
      garageId: json['garageId'] as int,
      garageName: json['garageName'] as String,
    );

Map<String, dynamic> _$AuctionShortDtoToJson(AuctionShortDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'vehicleVin': instance.vehicleVin,
      'vehicleModel': instance.vehicleModel,
      'vehicleBrand': instance.vehicleBrand,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'startPrice': instance.startPrice,
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'buyerId': instance.buyerId,
      'buyerName': instance.buyerName,
      'buyerFee': instance.buyerFee,
      'sellerFee': instance.sellerFee,
      'status': instance.status,
      'statusText': instance.statusText,
      'garageId': instance.garageId,
      'garageName': instance.garageName,
    };
