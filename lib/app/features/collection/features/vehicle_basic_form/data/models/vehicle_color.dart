import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_color.g.dart";

@JsonSerializable()
class VehicleColor extends Equatable {
  const VehicleColor({
    required this.id,
    required this.name,
    required this.code,
  });
  factory VehicleColor.fromJson(final Map<String, dynamic> json) => _$VehicleColorFromJson(json);

  final int id;
  final String name;
  final String code;

  @override
  List<Object?> get props => [id, name, code];
}
