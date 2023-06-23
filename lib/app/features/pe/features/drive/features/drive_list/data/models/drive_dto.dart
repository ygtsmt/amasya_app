import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "drive_dto.g.dart";

@JsonSerializable()
class DriveDto extends Equatable {
  const DriveDto({
    required this.vehicleId,
    required this.customerId,
    required this.licencePlateId,
    required this.handoverKm,
    required this.handoverFuel,
    required this.status,
    required this.carType,
    required this.price,
    required this.duration,
    required this.durationKm,
    required this.signatureBase64,
    required this.handoverDate,
    this.rightId,
    this.id = 0,
    this.vehicleVin = "",
    this.customerName = "",
    this.licencePlateText = "",
    this.statusText = "",
    this.carTypeText = "",
    this.garageId = 0,
    this.rightText = "",
    this.returnDate,
    this.returnKm,
    this.returnFuel,
    this.note,
  });
  factory DriveDto.fromJson(final Map<String, dynamic> json) => _$DriveDtoFromJson(json);

  final int id;
  final int vehicleId;
  final String vehicleVin;
  final int customerId;
  final String customerName;
  final int licencePlateId;
  final String licencePlateText;
  final int handoverKm;
  final int? returnKm;
  final int handoverFuel;
  final int? returnFuel;
  final int? rightId;
  final String rightText;
  final String signatureBase64;
  final DateTime handoverDate;
  final DateTime? returnDate;
  final String? note;
  final int status;
  final String statusText;
  final int carType;
  final String carTypeText;
  final double price;
  final String duration;
  final int durationKm;
  final int garageId;

  Map<String, dynamic> toJson() => _$DriveDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        vehicleId,
        vehicleVin,
        customerId,
        customerName,
        licencePlateId,
        licencePlateText,
        handoverKm,
        returnKm,
        handoverFuel,
        returnFuel,
        rightId,
        rightText,
        signatureBase64,
        handoverDate,
        returnDate,
        note,
        status,
        statusText,
        carType,
        carTypeText,
        price,
        duration,
        durationKm,
        garageId,
      ];
}
