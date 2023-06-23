import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_brand.g.dart";

@JsonSerializable()
class VehicleBrand extends Equatable {
  const VehicleBrand({
    required this.id,
    required this.name,
  });
  factory VehicleBrand.fromJson(final Map<String, dynamic> json) => _$VehicleBrandFromJson(json);

  final int id;
  final String name;

  Map<String, dynamic> toJson() => _$VehicleBrandToJson(this);

  @override
  List<Object?> get props => [id, name];
}
