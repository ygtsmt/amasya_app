import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "auction_short_dto.g.dart";

@JsonSerializable()
class AuctionShortDto extends Equatable {
  const AuctionShortDto({
    required this.id,
    required this.vehicleId,
    required this.vehicleVin,
    required this.vehicleModel,
    required this.vehicleBrand,
    required this.expirationDate,
    required this.startDate,
    required this.startPrice,
    required this.sellerId,
    required this.sellerName,
    required this.buyerId,
    required this.buyerName,
    required this.buyerFee,
    required this.sellerFee,
    required this.status,
    required this.statusText,
    required this.garageId,
    required this.garageName,
  });
  factory AuctionShortDto.fromJson(final Map<String, dynamic> json) => _$AuctionShortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionShortDtoToJson(this);
  final int id;
  final int vehicleId;
  final String vehicleVin;
  final String vehicleModel;
  final String vehicleBrand;
  final DateTime expirationDate;
  final DateTime startDate;
  final double startPrice;
  final int sellerId;
  final String sellerName;
  final int buyerId;
  final String buyerName;
  final double buyerFee;
  final double sellerFee;
  final int status;
  final String statusText;
  final int garageId;
  final String garageName;

  @override
  List<Object?> get props => [
        id,
        vehicleId,
        vehicleVin,
        vehicleModel,
        vehicleBrand,
        expirationDate,
        startDate,
        startPrice,
        sellerId,
        sellerName,
        buyerId,
        buyerName,
        buyerFee,
        sellerFee,
        status,
        statusText,
        garageId,
        garageName,
      ];
}
