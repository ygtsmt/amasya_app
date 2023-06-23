import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "auction_create_dto.g.dart";

@JsonSerializable()
class AuctionCreateDto extends Equatable {
  const AuctionCreateDto({
    required this.vehicleId,
    required this.expirationDate,
    required this.startDate,
    required this.startPrice,
    required this.sellerId,
    required this.status,
  });
  factory AuctionCreateDto.fromJson(final Map<String, dynamic> json) => _$AuctionCreateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionCreateDtoToJson(this);

  final int vehicleId;
  final DateTime expirationDate;
  final DateTime startDate;
  final double startPrice;
  final int sellerId;
  final int status;

  @override
  List<Object?> get props => [
        vehicleId,
        expirationDate,
        startDate,
        startPrice,
        sellerId,
        status,
      ];
}
