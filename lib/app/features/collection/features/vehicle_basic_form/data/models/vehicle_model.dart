import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "vehicle_model.g.dart";

@JsonSerializable()
class VehicleModel extends Equatable {
  const VehicleModel({
    required this.id,
    required this.name,
  });
  factory VehicleModel.fromJson(final Map<String, dynamic> json) => _$VehicleModelFromJson(json);

  final int id;
  final String name;

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);

  @override
  List<Object?> get props => [id, name];
}
