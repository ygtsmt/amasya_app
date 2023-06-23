// -- vehicle_long_dto.dart --
import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";
import "package:revogarageapp/core/enums.dart";

part "vehicle_long_dto.g.dart";

@JsonSerializable()
class VehicleLongDto extends Equatable {
  const VehicleLongDto({
    required this.id,
    required this.vehicleBrandId,
    required this.vehicleBrandName,
    required this.vehicleModelId,
    required this.vehicleModelName,
    required this.vehicleColorId,
    required this.vehicleColorName,
    required this.vin,
    required this.mileage,
    required this.type,
    required this.isNew,
    required this.internalNumber,
    this.vehicleFuelTypeId,
    this.vehicleFuelTypeName,
    this.typeCertification,
    this.notes,
    this.marketDate,
    this.battery,
    this.sService,
    this.mfk,
    // ignore: non_constant_identifier_names
    this.mfk_Price,
    this.breaksFront,
    this.breaksRear,
    this.engineOilLeak,
    this.transOilLeak,
    this.controlLight,
    this.transType,
    this.driveable,
    this.axelLoader1,
    this.axelLoader2,
    this.note,
    this.serviceType = VehicleServiceType.unknown,
    this.serviceTypePrice,
    this.priceBreaksFront,
    this.priceBreaksRear,
    this.priceTransOilLeak,
    this.priceControlLight,
    this.priceEngineOilLeak,
    this.interior,
    this.summerTireId,
    this.winterTireId,
    this.allSeasonId,
    this.tags,
    this.servicePrice,
  });
  factory VehicleLongDto.fromJson(final Map<String, dynamic> json) => _$VehicleLongDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleLongDtoToJson(this);
  final int id;
  final int vehicleBrandId;
  final String vehicleBrandName;
  final int vehicleModelId;
  final String vehicleModelName;
  final int vehicleColorId;
  final String vehicleColorName;
  final String vin;
  final int mileage;
  final int type;
  final bool isNew;
  final int? vehicleFuelTypeId;
  final String? vehicleFuelTypeName;
  final String? typeCertification;
  final String? notes;
  final String internalNumber;
  final DateTime? marketDate;
  final int? battery;
  final bool? sService;
  final bool? mfk;
  final int serviceType;
  final double? serviceTypePrice;
  // ignore: non_constant_identifier_names
  final double? mfk_Price;
  final bool? breaksFront;
  final bool? breaksRear;
  final bool? engineOilLeak;
  final bool? transOilLeak;
  final bool? controlLight;
  final String? transType;
  final bool? driveable;
  final String? axelLoader1;
  final String? axelLoader2;
  final String? note;
  final double? priceBreaksFront;
  final double? priceBreaksRear;
  final double? priceTransOilLeak;
  final double? priceControlLight;
  final double? priceEngineOilLeak;
  final String? interior;
  final int? summerTireId;
  final int? winterTireId;
  final int? allSeasonId;
  final String? tags;
  final double? servicePrice;

  VehicleLongDto copyWith({
    final int? id,
    final int? vehicleBrandId,
    final String? vehicleBrandName,
    final int? vehicleModelId,
    final String? vehicleModelName,
    final int? vehicleColorId,
    final String? vehicleColorName,
    final String? vin,
    final int? mileage,
    final int? type,
    final bool? isNew,
    final int? vehicleFuelTypeId,
    final String? vehicleFuelTypeName,
    final String? typeCertification,
    final String? notes,
    final String? internalNumber,
    final DateTime? marketDate,
    final int? battery,
    final bool? sService,
    final bool? mfk,
    // ignore: non_constant_identifier_names
    final double? mfk_Price,
    final bool? breaksFront,
    final bool? breaksRear,
    final bool? engineOilLeak,
    final bool? transOilLeak,
    final bool? controlLight,
    final String? transType,
    final bool? driveable,
    final String? axelLoader1,
    final String? axelLoader2,
    final String? note,
    final int? serviceType,
    final double? serviceTypePrice,
    final double? priceBreaksFront,
    final double? priceBreaksRear,
    final double? priceTransOilLeak,
    final double? priceControlLight,
    final double? priceEngineOilLeak,
    final String? interior,
    final int? summerTireId,
    final int? winterTireId,
    final int? allSeasonId,
    final String? tags,
    final double? servicePrice,
  }) {
    return VehicleLongDto(
      id: id ?? this.id,
      vehicleBrandId: vehicleBrandId ?? this.vehicleBrandId,
      vehicleBrandName: vehicleBrandName ?? this.vehicleBrandName,
      vehicleModelId: vehicleModelId ?? this.vehicleModelId,
      vehicleModelName: vehicleModelName ?? this.vehicleModelName,
      vehicleColorId: vehicleColorId ?? this.vehicleColorId,
      vehicleColorName: vehicleColorName ?? this.vehicleColorName,
      vin: vin ?? this.vin,
      mileage: mileage ?? this.mileage,
      type: type ?? this.type,
      isNew: isNew ?? this.isNew,
      vehicleFuelTypeId: vehicleFuelTypeId ?? this.vehicleFuelTypeId,
      vehicleFuelTypeName: vehicleFuelTypeName ?? this.vehicleFuelTypeName,
      typeCertification: typeCertification ?? this.typeCertification,
      notes: notes ?? this.notes,
      internalNumber: internalNumber ?? this.internalNumber,
      marketDate: marketDate ?? this.marketDate,
      battery: battery ?? this.battery,
      sService: sService ?? this.sService,
      mfk: mfk ?? this.mfk,
      // ignore: non_constant_identifier_names
      mfk_Price: mfk_Price ?? this.mfk_Price,
      breaksFront: breaksFront ?? this.breaksFront,
      breaksRear: breaksRear ?? this.breaksRear,
      engineOilLeak: engineOilLeak ?? this.engineOilLeak,
      transOilLeak: transOilLeak ?? this.transOilLeak,
      controlLight: controlLight ?? this.controlLight,
      transType: transType ?? this.transType,
      driveable: driveable ?? this.driveable,
      axelLoader1: axelLoader1 ?? this.axelLoader1,
      axelLoader2: axelLoader2 ?? this.axelLoader2,
      note: note ?? this.note,
      serviceType: serviceType ?? this.serviceType,
      serviceTypePrice: serviceTypePrice ?? this.serviceTypePrice,
      priceBreaksFront: priceBreaksFront ?? this.priceBreaksFront,
      priceBreaksRear: priceBreaksRear ?? this.priceBreaksRear,
      priceTransOilLeak: priceTransOilLeak ?? this.priceTransOilLeak,
      priceControlLight: priceControlLight ?? this.priceControlLight,
      priceEngineOilLeak: priceEngineOilLeak ?? this.priceEngineOilLeak,
      interior: interior ?? this.interior,
      summerTireId: summerTireId ?? this.summerTireId,
      winterTireId: winterTireId ?? this.winterTireId,
      allSeasonId: allSeasonId ?? this.allSeasonId,
      tags: tags ?? this.tags,
      servicePrice: servicePrice ?? this.servicePrice,
    );
  }

  @override
  List<Object?> get props => [
        id,
        vehicleModelId,
        vehicleModelName,
        vehicleColorId,
        vehicleColorName,
        vin,
        mileage,
        type,
        isNew,
        vehicleFuelTypeId,
        vehicleFuelTypeName,
        typeCertification,
        notes,
        internalNumber,
        marketDate,
        battery,
        sService,
        mfk,
        // ignore: non_constant_identifier_names
        mfk_Price,
        breaksFront,
        breaksRear,
        engineOilLeak,
        transOilLeak,
        controlLight,
        transType,
        driveable,
        axelLoader1,
        axelLoader2,
        note,
        serviceType,
        serviceTypePrice,
        priceBreaksFront,
        priceBreaksRear,
        priceTransOilLeak,
        priceControlLight,
        priceEngineOilLeak,
        interior,
        summerTireId,
        winterTireId,
        allSeasonId,
        tags,
        servicePrice,
      ];
}
