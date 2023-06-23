import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_tire_detail_dto.g.dart";

@JsonSerializable()
class VehicleTireDetailDto extends Equatable {
  const VehicleTireDetailDto({
    this.id = 0,
    this.vehicleTireType,
    this.frontTireBrandId,
    this.frontTireRimId,
    this.frontDimention,
    this.frontRimProfile,
    this.rearTireBrandId,
    this.rearTireRimId,
    this.rearDimention,
    this.rearRimProfile,
  });
  factory VehicleTireDetailDto.fromJson(final Map<String, dynamic> json) => _$VehicleTireDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleTireDetailDtoToJson(this);

  final int id;
  final int? vehicleTireType;

  final int? frontTireBrandId;
  final int? frontTireRimId;
  final String? frontDimention;
  final String? frontRimProfile;

  final int? rearTireBrandId;
  final int? rearTireRimId;
  final String? rearDimention;
  final String? rearRimProfile;

  VehicleTireDetailDto copyWith({
    final int? id,
    final int? vehicleTireType,
    final int? frontTireBrandId,
    final int? frontTireRimId,
    final String? frontDimention,
    final String? frontRimProfile,
    final int? rearTireBrandId,
    final int? rearTireRimId,
    final String? rearDimention,
    final String? rearRimProfile,
  }) {
    return VehicleTireDetailDto(
      id: id ?? this.id,
      vehicleTireType: vehicleTireType ?? this.vehicleTireType,
      frontTireBrandId: frontTireBrandId ?? this.frontTireBrandId,
      frontTireRimId: frontTireRimId ?? this.frontTireRimId,
      frontDimention: frontDimention ?? this.frontDimention,
      frontRimProfile: frontRimProfile ?? this.frontRimProfile,
      rearTireBrandId: rearTireBrandId ?? this.rearTireBrandId,
      rearTireRimId: rearTireRimId ?? this.rearTireRimId,
      rearDimention: rearDimention ?? this.rearDimention,
      rearRimProfile: rearRimProfile ?? this.rearRimProfile,
    );
  }

  @override
  List<Object?> get props => [
        id,
        vehicleTireType,
        frontTireBrandId,
        frontTireRimId,
        frontDimention,
        frontRimProfile,
        rearTireBrandId,
        rearTireRimId,
        rearDimention,
        rearRimProfile,
      ];
}
