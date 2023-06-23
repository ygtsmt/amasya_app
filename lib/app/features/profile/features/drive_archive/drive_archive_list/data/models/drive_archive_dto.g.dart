// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_archive_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriveArchiveDto _$DriveArchiveDtoFromJson(Map<String, dynamic> json) =>
    DriveArchiveDto(
      vehicleId: json['vehicleId'] as int,
      customerId: json['customerId'] as int,
      licencePlateId: json['licencePlateId'] as int,
      handoverKm: json['handoverKm'] as int,
      handoverFuel: json['handoverFuel'] as int,
      status: json['status'] as int,
      carType: json['carType'] as int,
      price: (json['price'] as num).toDouble(),
      duration: json['duration'] as String,
      durationKm: json['durationKm'] as int,
      rightId: json['rightId'] as int,
      signatureBase64: json['signatureBase64'] as String,
      handoverDate: DateTime.parse(json['handoverDate'] as String),
      id: json['id'] as int? ?? 0,
      vehicleVin: json['vehicleVin'] as String? ?? "",
      customerName: json['customerName'] as String? ?? "",
      licencePlateText: json['licencePlateText'] as String? ?? "",
      statusText: json['statusText'] as String? ?? "",
      carTypeText: json['carTypeText'] as String? ?? "",
      garageId: json['garageId'] as int? ?? 0,
      rightText: json['rightText'] as String? ?? "",
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      returnKm: json['returnKm'] as int?,
      returnFuel: json['returnFuel'] as int?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$DriveArchiveDtoToJson(DriveArchiveDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'vehicleVin': instance.vehicleVin,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'licencePlateId': instance.licencePlateId,
      'licencePlateText': instance.licencePlateText,
      'handoverKm': instance.handoverKm,
      'returnKm': instance.returnKm,
      'handoverFuel': instance.handoverFuel,
      'returnFuel': instance.returnFuel,
      'rightId': instance.rightId,
      'rightText': instance.rightText,
      'signatureBase64': instance.signatureBase64,
      'handoverDate': instance.handoverDate.toIso8601String(),
      'returnDate': instance.returnDate?.toIso8601String(),
      'note': instance.note,
      'status': instance.status,
      'statusText': instance.statusText,
      'carType': instance.carType,
      'carTypeText': instance.carTypeText,
      'price': instance.price,
      'duration': instance.duration,
      'durationKm': instance.durationKm,
      'garageId': instance.garageId,
    };
